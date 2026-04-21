import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class TransactionTableCalender extends StatelessWidget {
  final DateTime firstDay;
  final DateTime lastDay;
  final DateTime focusedDay;
  final DateTime? rangeEndDay;
  final DateTime? rangeStartDay;
  final CalendarFormat calendarFormat;
  final RangeSelectionMode rangeSelectionMode;
  final Function(DateTime?, DateTime?, DateTime)? onRangeSelected;
  final Function(DateTime, DateTime)? onDaySelected;
  final Function(CalendarFormat)? onFormatChanged;
  final Function(DateTime)? onPageChanged;
  final DateTime selectDay;
  const TransactionTableCalender({
    super.key,
    required this.firstDay,
    required this.lastDay,
    required this.focusedDay,
    this.rangeEndDay,
    this.rangeStartDay,
    required this.calendarFormat,
    required this.rangeSelectionMode,
    this.onRangeSelected,
    this.onDaySelected,
    this.onFormatChanged,
    this.onPageChanged,
    required this.selectDay,
  });

  @override
  Widget build(BuildContext context) {
    final weekDay = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return LayoutBuilder(
      builder: (context, constrains) {
        double totalHeight = constrains.maxHeight;
        double headerHeight = 65.h;
        double weekBarHeight = 26.h;
        double remainingHeight = totalHeight - headerHeight - weekBarHeight;
        double rowHeight = remainingHeight / 6;
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: isDark ? AppColors.labelColor : AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4.72),
                blurRadius: 16.52,
                color: AppColors.shadowColor.withValues(alpha: .10),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: TableCalendar(
              firstDay: firstDay,
              lastDay: lastDay,
              focusedDay: focusedDay,
              calendarFormat: calendarFormat,
              rangeSelectionMode: rangeSelectionMode,
              rangeStartDay: rangeStartDay,
              rangeEndDay: rangeEndDay,
              onDaySelected: onDaySelected,
              onRangeSelected: onRangeSelected,
              onPageChanged: onPageChanged,
              onFormatChanged: onFormatChanged,
              rowHeight: rowHeight,
              daysOfWeekHeight: weekBarHeight,
              selectedDayPredicate: (day) => isSameDay(day, selectDay),
              headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  color: isDark
                      ? Color(0xFF0F0029)
                      : AppColors.darkActiveTextColor,
                ),
                titleCentered: true,
                formatButtonVisible: false,
                headerMargin: EdgeInsets.zero,
                headerPadding: EdgeInsets.zero,
                titleTextStyle: textDecoration(
                  fontSize: 13.sp,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.labelColor,
                ),
                leftChevronIcon: icon(
                  icon: Icons.arrow_back_ios,
                  context: context,
                ),
                rightChevronIcon: icon(
                  icon: Icons.arrow_forward_ios,
                  context: context,
                ),
              ),
              sixWeekMonthsEnforced: false,
              daysOfWeekVisible: true,
              calendarStyle: CalendarStyle(
                cellMargin: EdgeInsets.all(3.r),
                selectedTextStyle: textDecoration(
                  color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                ),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isDark
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                  ),
                ),
                defaultTextStyle: textDecoration(
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.labelColor,
                ),
                todayTextStyle: textDecoration(color: AppColors.borderColor),
                outsideTextStyle: textDecoration(
                  color: isDark ? AppColors.borderColor : AppColors.labelColor,
                ),
                weekendTextStyle: textDecoration(
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.labelColor,
                ),
                rangeHighlightColor: isDark
                    ? AppColors.darkPrimaryTextColor
                    : AppColors.boxColor,
                withinRangeTextStyle: textDecoration(
                  color: AppColors.labelColor,
                ),
                todayDecoration: BoxDecoration(shape: BoxShape.rectangle),
                rangeEndTextStyle: textDecoration(color: AppColors.labelColor),
                rangeStartTextStyle: textDecoration(
                  color: AppColors.labelColor,
                ),
                rangeStartDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.boxColor,
                ),
                rangeEndDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.boxColor,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: textDecoration(
                  fontSize: 8.35.sp,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.labelColor,
                ),
                weekdayStyle: textDecoration(
                  fontSize: 8.35.sp,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.labelColor,
                ),
                dowTextFormatter: (date, locale) {
                  return weekDay[date.weekday % 7];
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget icon({required IconData icon, required BuildContext context}) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Icon(
        icon,
        size: 10.sp,
        color: isDark ? AppColors.whiteColor : AppColors.labelColor,
      ),
    );
  }

  TextStyle textDecoration({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? 11.69.sp,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color ?? Color(0xFF051B44),
    );
  }
}
