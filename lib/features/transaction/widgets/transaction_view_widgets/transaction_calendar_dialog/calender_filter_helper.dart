import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

extension DateTimeExtension on DateTime {
  DateTime get startOfMonth => DateTime(year, month, 1);
  DateTime get endOfMonth => DateTime(year, month + 1, 0);
  DateTime get startOfYear => DateTime(year, 1, 1);
  DateTime get endOfYear => DateTime(year, 12, 31);
}

void calenderFilter({
  required int index,
  required Rx<DateTime> selectedDay,
  required Rx<DateTime?> rangeStart,
  required Rx<DateTime?> rangeEnd,
  required Rx<RangeSelectionMode> rangeSelectionMode,
  required Rx<DateTime> focusedDay,
  Map<int, Map<String, dynamic>>? customFilters,
}) {
  DateTime now = DateTime.now();

  if (customFilters != null && customFilters.containsKey(index)) {
    final filter = customFilters[index]!;
    if (filter['selectedDay'] != null) {
      selectedDay.value = filter['selectedDay'];
    }
    rangeStart.value = filter['rangeStart'];
    rangeEnd.value = filter['rangeEnd'];
    rangeSelectionMode.value =
        filter['rangeSelectionMode'] ?? RangeSelectionMode.toggledOff;
  } else {
    switch (index) {
      case 0:
        rangeStart.value = null;
        rangeEnd.value = null;
        rangeSelectionMode.value = RangeSelectionMode.toggledOn;
        focusedDay.value = now;
        break;

      case 1:
        selectedDay.value = now;
        rangeStart.value = null;
        rangeEnd.value = null;
        rangeSelectionMode.value = RangeSelectionMode.toggledOff;
        focusedDay.value = now;
        break;

      case 2:
        final d = now.subtract(const Duration(days: 1));
        selectedDay.value = d;
        rangeStart.value = null;
        rangeEnd.value = null;
        rangeSelectionMode.value = RangeSelectionMode.toggledOff;
        focusedDay.value = d;
        break;

      case 3:
        rangeStart.value = now;
        rangeEnd.value = now.subtract(const Duration(days: 6));
        rangeSelectionMode.value = RangeSelectionMode.toggledOn;
        focusedDay.value = rangeEnd.value!;
        break;
      case 4:
        rangeStart.value = now.subtract(const Duration(days: 6));
        rangeEnd.value = now;
        rangeSelectionMode.value = RangeSelectionMode.toggledOn;
        focusedDay.value = rangeEnd.value!;
        break;
      case 5:
        rangeStart.value = now;
        rangeEnd.value = now.subtract(const Duration(days: 29));
        rangeSelectionMode.value = RangeSelectionMode.toggledOn;
        focusedDay.value = rangeEnd.value!;
        break;
      case 6:
        rangeStart.value = now.subtract(const Duration(days: 29));
        rangeEnd.value = now;
        rangeSelectionMode.value = RangeSelectionMode.toggledOn;
        focusedDay.value = rangeEnd.value!;
        break;
      case 7:
        rangeStart.value = DateTime(now.year, 1, 1);
        rangeEnd.value = DateTime(now.year, 12, 31);
        rangeSelectionMode.value = RangeSelectionMode.toggledOn;
        focusedDay.value = rangeEnd.value!;
        break;
      case 8:
        rangeStart.value = DateTime(now.year , 1, 1);
        rangeEnd.value = DateTime(now.year, 12, 31);
        rangeSelectionMode.value = RangeSelectionMode.toggledOn;
        focusedDay.value = rangeEnd.value!;
        break;
    }
  }
  selectedDay.value = selectedDay.value;
}
