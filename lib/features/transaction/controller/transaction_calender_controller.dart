import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TransactionCalenderController extends GetxController {
  RxInt isDay = 0.obs;
  final focusedDay = DateTime.now().obs;
  final selectedDay = DateTime.now().obs;
  final _monthLabelFormatter = DateFormat('MMMM, yyyy');

  String get selectedMonthLabel {
    if (rangeStart.value != null && rangeEnd.value != null) {
      final start = rangeStart.value!;
      final end = rangeEnd.value!;

      if (start.year == end.year && start.month == end.month) {
        return _monthLabelFormatter.format(start);
      }

      return '${_monthLabelFormatter.format(start)} - ${_monthLabelFormatter.format(end)}';
    }

    return _monthLabelFormatter.format(selectedDay.value);
  }


  late DateTime firstDay;
  late DateTime lastDay;
  Rx<DateTime?> rangeStart = Rxn<DateTime>();
  Rx<DateTime?> rangeEnd = Rxn<DateTime>();
  Rx<RangeSelectionMode> rangeSelectionMode = RangeSelectionMode.toggledOn.obs;
  Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  @override
  void onInit() {
    final today = DateTime.now();
    firstDay = DateTime(today.year - 1, today.month, today.day);
    lastDay = DateTime(today.year + 1, today.month, today.day);
    super.onInit();
  }

  void onDaySelected(DateTime day, DateTime focused) {
    selectedDay.value = day;
    focusedDay.value = focused;
    rangeStart.value = null;
    rangeEnd.value = null;
  }

}
