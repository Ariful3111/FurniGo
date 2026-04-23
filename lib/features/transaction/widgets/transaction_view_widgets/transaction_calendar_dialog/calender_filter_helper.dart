import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

extension DateTimeExtension on DateTime {
  DateTime get startOfMonth => DateTime(year, month, 1);
  DateTime get endOfMonth => DateTime(year, month + 1, 0);
  DateTime get startOfYear => DateTime(year, 1, 1);
  DateTime get endOfYear => DateTime(year, 12, 31);
}

/// Returns the most recent Friday (start of the custom week) on or before [date].
DateTime _startOfWeek(DateTime date) {
  // weekday: Mon=1, Tue=2, Wed=3, Thu=4, Fri=5, Sat=6, Sun=7
  // Days since last Friday:
  //   Fri=5 → 0, Sat=6 → 1, Sun=7 → 2, Mon=1 → 3, Tue=2 → 4, Wed=3 → 5, Thu=4 → 6
  final int daysSinceFriday = (date.weekday + 2) % 7;
  return date.subtract(Duration(days: daysSinceFriday));
}

/// Returns the Thursday that ends the custom week containing [date].
DateTime _endOfWeek(DateTime date) => _startOfWeek(date).add(const Duration(days: 6));

void calenderFilter({
  required int index,
  required Rx<DateTime> selectedDay,
  required Rx<DateTime?> rangeStart,
  required Rx<DateTime?> rangeEnd,
  required Rx<RangeSelectionMode> rangeSelectionMode,
  required Rx<DateTime> focusedDay,
  Map<int, Map<String, dynamic>>? customFilters,
}) {
  final DateTime now = DateTime.now();
  final DateTime today = DateTime(now.year, now.month, now.day);

  if (customFilters != null && customFilters.containsKey(index)) {
    final filter = customFilters[index]!;
    if (filter['selectedDay'] != null) selectedDay.value = filter['selectedDay'];
    rangeStart.value = filter['rangeStart'];
    rangeEnd.value = filter['rangeEnd'];
    rangeSelectionMode.value =
        filter['rangeSelectionMode'] ?? RangeSelectionMode.toggledOff;
    focusedDay.value = rangeEnd.value ?? rangeStart.value ?? today;
    return;
  }

  switch (index) {
    case 0:
      rangeStart.value = null;
      rangeEnd.value = null;
      rangeSelectionMode.value = RangeSelectionMode.toggledOn;
      focusedDay.value = today;
      break;

    case 1:
      selectedDay.value = today;
      rangeStart.value = null;
      rangeEnd.value = null;
      rangeSelectionMode.value = RangeSelectionMode.toggledOff;
      focusedDay.value = today;
      break;

    case 2:
      final DateTime yesterday = today.subtract(const Duration(days: 1));
      selectedDay.value = yesterday;
      rangeStart.value = null;
      rangeEnd.value = null;
      rangeSelectionMode.value = RangeSelectionMode.toggledOff;
      focusedDay.value = yesterday;
      break;


    case 3:
      final DateTime start = _startOfWeek(today); // most recent Friday
      final DateTime end   = _endOfWeek(today);   // coming Thursday
      rangeStart.value = start;
      rangeEnd.value   = end;
      rangeSelectionMode.value = RangeSelectionMode.toggledOn;
      focusedDay.value = start;
      break;

    case 4:
      final DateTime thisWeekStart = _startOfWeek(today);
      final DateTime lastWeekEnd   = thisWeekStart.subtract(const Duration(days: 1)); // prev Thursday
      final DateTime lastWeekStart = _startOfWeek(lastWeekEnd);                       // prev Friday
      rangeStart.value = lastWeekStart;
      rangeEnd.value   = lastWeekEnd;
      rangeSelectionMode.value = RangeSelectionMode.toggledOn;
      focusedDay.value = lastWeekStart;
      break;

    case 5:
      rangeStart.value = DateTime(today.year, today.month, 1);
      rangeEnd.value   = DateTime(today.year, today.month + 1, 0); // last day
      rangeSelectionMode.value = RangeSelectionMode.toggledOn;
      focusedDay.value = DateTime(today.year, today.month, 1);
      break;
    case 6:
      final DateTime firstOfThisMonth = DateTime(today.year, today.month, 1);
      final DateTime lastOfLastMonth  = firstOfThisMonth.subtract(const Duration(days: 1));
      final DateTime firstOfLastMonth = DateTime(lastOfLastMonth.year, lastOfLastMonth.month, 1);
      rangeStart.value = firstOfLastMonth;
      rangeEnd.value   = lastOfLastMonth;
      rangeSelectionMode.value = RangeSelectionMode.toggledOn;
      focusedDay.value = firstOfLastMonth;
      break;
    case 7:
      rangeStart.value = DateTime(today.year, 1, 1);
      rangeEnd.value   = DateTime(today.year, 12, 31);
      rangeSelectionMode.value = RangeSelectionMode.toggledOn;
      focusedDay.value = DateTime(today.year, 1, 1);
      break;
    case 8:
      rangeStart.value = DateTime(today.year - 1, 1, 1);
      rangeEnd.value   = DateTime(today.year - 1, 12, 31);
      rangeSelectionMode.value = RangeSelectionMode.toggledOn;
      focusedDay.value = DateTime(today.year - 1, 1, 1);
      break;
  }
}