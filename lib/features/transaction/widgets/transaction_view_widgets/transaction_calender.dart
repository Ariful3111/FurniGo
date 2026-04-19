import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zb_dezign/features/transaction/controller/transaction_calender_controller.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_view_widgets/transaction_calendar_dialog/calender_filter.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_view_widgets/transaction_calendar_dialog/calender_filter_helper.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_view_widgets/transaction_calendar_dialog/transaction_table_calender.dart';

class TransactionCalender extends GetWidget<TransactionCalenderController> {
  const TransactionCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CalenderFilter(
        widget: TransactionTableCalender(
          firstDay: controller.firstDay,
          lastDay: controller.lastDay,
          focusedDay: controller.focusedDay.value,
          calendarFormat: controller.calendarFormat.value,
          rangeSelectionMode: controller.rangeSelectionMode.value,
          rangeEndDay: controller.rangeEnd.value,
          rangeStartDay: controller.rangeStart.value,
          onDaySelected: (DateTime selectDay, DateTime focus) {
            if (controller.isDay.value != 0) {
              controller.isDay.value = 0;
              controller.rangeSelectionMode.value =
                  RangeSelectionMode.toggledOn;
            }
            controller.focusedDay.value = focus;
            controller.selectedDay.value = selectDay;
            controller.rangeStart.value = null;
            controller.rangeEnd.value = null;
          },
          onRangeSelected: (DateTime? start, DateTime? end, DateTime focus) {
            if (controller.isDay.value != 0) {
              controller.isDay.value = 0;
            }
            controller.isDay.value = 0;
            controller.rangeStart.value = start;
            controller.rangeEnd.value = end;
            controller.focusedDay.value = focus;
            controller.rangeSelectionMode.value =
                RangeSelectionMode.toggledOn;
          },
          onPageChanged: (DateTime day) {
            controller.focusedDay.value = day;
          },
          onFormatChanged: (format) {
            if (controller.calendarFormat.value != format) {
              controller.calendarFormat.value = format;
            }
          },
          selectDay: controller.selectedDay.value,
        ),
        isDay: controller.isDay.value,
        onTap: (index) {
          controller.isDay.value = index;
          calenderFilter(
            index: index,
            selectedDay: controller.selectedDay,
            rangeStart: controller.rangeStart,
            rangeEnd: controller.rangeEnd,
            rangeSelectionMode: controller.rangeSelectionMode,
            focusedDay: controller.focusedDay,
          );
        },
        onApply: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
