// import 'package:get/get.dart';
// import 'package:zb_dezign/features/transaction/controller/transaction_controller.dart';

// class TransactionCalenderController extends GetxController {
//   final TransactionController transactionController = Get.find();
//   final DateTime firstDay = DateTime.utc(2000, 1, 1);
//   final DateTime lastDay = DateTime.utc(2100, 12, 31);

//   final RxString selectedRangeType = 'Custom'.obs;
//   final Rxn<DateTime> rangeStart = Rxn<DateTime>();
//   final Rxn<DateTime> rangeEnd = Rxn<DateTime>();
//   final Rx<DateTime> focusedDay = DateTime.now().obs;

//   static const List<String> rangeOptions = <String>[
//     'Custom',
//     'Today',
//     'Yesterday',
//     'This Week',
//     'Last Week',
//     'This Month',
//     'Last Month',
//     'This Year',
//     'Last Year',
//   ];

//   @override
//   void onInit() {
//     super.onInit();
//     selectedRangeType.value = transactionController.selectedRangeType.value;
//     rangeStart.value = transactionController.fromDate.value;
//     rangeEnd.value = transactionController.toDate.value;
//     focusedDay.value = rangeStart.value ?? DateTime.now();
//   }

//   String get fromText => transactionController.formatDate(rangeStart.value);
//   String get toText =>
//       transactionController.formatDate(rangeEnd.value ?? rangeStart.value);

//   DateTime get _monthStart =>
//       DateTime(focusedDay.value.year, focusedDay.value.month, 1);

//   bool get canGoPrev {
//     final minMonth = DateTime(firstDay.year, firstDay.month, 1);
//     return _monthStart.isAfter(minMonth);
//   }

//   bool get canGoNext {
//     final maxMonth = DateTime(lastDay.year, lastDay.month, 1);
//     return _monthStart.isBefore(maxMonth);
//   }

//   void goPrevMonth() {
//     if (!canGoPrev) return;
//     focusedDay.value = _addMonths(focusedDay.value, -1);
//   }

//   void goNextMonth() {
//     if (!canGoNext) return;
//     focusedDay.value = _addMonths(focusedDay.value, 1);
//   }

//   void selectRangeType(String type) {
//     selectedRangeType.value = type;
//     final now = DateTime.now();
//     final today = DateTime(now.year, now.month, now.day);

//     DateTime start;
//     DateTime end;

//     if (type == 'Custom') {
//       start = rangeStart.value ?? today;
//       end = rangeEnd.value ?? rangeStart.value ?? today;
//     } else if (type == 'Today') {
//       start = today;
//       end = today;
//     } else if (type == 'Yesterday') {
//       start = today.subtract(const Duration(days: 1));
//       end = start;
//     } else if (type == 'This Week') {
//       start = today.subtract(Duration(days: today.weekday - 1));
//       end = start.add(const Duration(days: 6));
//     } else if (type == 'Last Week') {
//       final thisWeekStart = today.subtract(Duration(days: today.weekday - 1));
//       start = thisWeekStart.subtract(const Duration(days: 7));
//       end = start.add(const Duration(days: 6));
//     } else if (type == 'This Month') {
//       start = DateTime(today.year, today.month, 1);
//       end = DateTime(today.year, today.month + 1, 0);
//     } else if (type == 'Last Month') {
//       final lastMonth = DateTime(today.year, today.month - 1, 1);
//       start = lastMonth;
//       end = DateTime(lastMonth.year, lastMonth.month + 1, 0);
//     } else if (type == 'This Year') {
//       start = DateTime(today.year, 1, 1);
//       end = DateTime(today.year, 12, 31);
//     } else {
//       start = DateTime(today.year - 1, 1, 1);
//       end = DateTime(today.year - 1, 12, 31);
//     }

//     rangeStart.value = start;
//     rangeEnd.value = end;
//     focusedDay.value = start;
//   }

//   void onRangeSelected(DateTime? start, DateTime? end, DateTime focused) {
//     selectedRangeType.value = 'Custom';
//     rangeStart.value = start;
//     rangeEnd.value = end;
//     focusedDay.value = focused;
//   }

//   void onDaySelected(DateTime selected, DateTime focused) {
//     selectedRangeType.value = 'Custom';
//     focusedDay.value = focused;

//     final day = DateTime(selected.year, selected.month, selected.day);
//     final currentStart = rangeStart.value;
//     final currentEnd = rangeEnd.value;

//     if (currentStart == null || currentEnd != null) {
//       rangeStart.value = day;
//       rangeEnd.value = null;
//       return;
//     }

//     if (day.isBefore(currentStart)) {
//       rangeStart.value = day;
//       rangeEnd.value = currentStart;
//       return;
//     }

//     rangeEnd.value = day;
//   }

//   void onPageChanged(DateTime focused) {
//     focusedDay.value = focused;
//   }

//   void apply() {
//     final now = DateTime.now();
//     final today = DateTime(now.year, now.month, now.day);
//     final start = rangeStart.value ?? today;
//     final end = rangeEnd.value ?? rangeStart.value ?? today;
//     transactionController.applyDateRange(
//       rangeType: selectedRangeType.value,
//       from: start,
//       to: end,
//     );
//     Get.back();
//   }

//   DateTime _addMonths(DateTime date, int months) {
//     final base = DateTime(date.year, date.month, 1);
//     final year = base.year + ((base.month - 1 + months) ~/ 12);
//     final month = ((base.month - 1 + months) % 12) + 1;
//     final clampedMonth = DateTime(year, month, 1);
//     final maxDay = DateTime(clampedMonth.year, clampedMonth.month + 1, 0).day;
//     final day = date.day.clamp(1, maxDay).toInt();
//     return DateTime(clampedMonth.year, clampedMonth.month, day);
//   }

//   String monthTitle(DateTime date) {
//     const names = [
//       'January',
//       'February',
//       'March',
//       'April',
//       'May',
//       'June',
//       'July',
//       'August',
//       'September',
//       'October',
//       'November',
//       'December',
//     ];
//     return '${names[date.month - 1]} ${date.year}';
//   }
// }
