import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/transaction/controller/transaction_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class TransactionCalender extends StatefulWidget {
  const TransactionCalender({super.key});

  @override
  State<TransactionCalender> createState() => _TransactionCalenderState();
}

class _TransactionCalenderState extends State<TransactionCalender> {
  static const _rangeOptions = <String>[
    'Custom',
    'Today',
    'Yesterday',
    'This Week',
    'Last Week',
    'This Month',
    'Last Month',
    'This Year',
    'Last Year',
  ];

  final TransactionController _transactionController = Get.find();
  final int _initialPage = 10000;
  late final PageController _pageController;

  late String _selectedRangeType;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  late DateTime _baseMonth;
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
    _currentPageIndex = _initialPage;
    _selectedRangeType = _transactionController.selectedRangeType.value;
    _rangeStart = _transactionController.fromDate.value;
    _rangeEnd = _transactionController.toDate.value;
    final seed = _rangeStart ?? DateTime.now();
    _baseMonth = DateTime(seed.year, seed.month, 1);
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final fromText = _transactionController.formatDate(_rangeStart);
    final toText = _transactionController.formatDate(_rangeEnd ?? _rangeStart);

    return Dialog(
      alignment: Alignment.center,
      insetPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 520.w, maxHeight: 520.h),
        child: SharedContainer(
          radius: 16.r,
          padding: EdgeInsets.all(16.r),
          color: isDark ? AppColors.darkColor : Color(0xFFFAFBFC),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomPrimaryText(
                      text: 'Select Dates',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.labelColor,
                    ),
                  ),
                  _dateField(context: context, title: 'From', value: fromText),
                  SizedBox(width: 12.w),
                  _dateField(context: context, title: 'To', value: toText),
                ],
              ),
              SizedBox(height: 12.h),
              Divider(
                height: 0,
                thickness: 1,
                color: isDark
                    ? AppColors.darkBorderColor
                    : AppColors.borderColor,
              ),
              SizedBox(height: 12.h),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      width: 140.w,
                      child: _rangeTypeList(isDark: isDark),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        children: [
                          _monthHeader(isDark: isDark),
                          SizedBox(height: 12.h),
                          Expanded(
                            child: PageView.builder(
                              controller: _pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPageIndex = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                final offset = (index - _initialPage) * 2;
                                final leftMonth = _addMonths(
                                  _baseMonth,
                                  offset,
                                );
                                final rightMonth = _addMonths(leftMonth, 1);
                                return Row(
                                  children: [
                                    Expanded(
                                      child: _calendarMonth(
                                        context: context,
                                        isDark: isDark,
                                        focusedMonth: leftMonth,
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Expanded(
                                      child: _calendarMonth(
                                        context: context,
                                        isDark: isDark,
                                        focusedMonth: rightMonth,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomPrimaryButton(
                    width: 140.w,
                    height: 40.h,
                    text: 'Cancel',
                    backgroundColor: isDark
                        ? AppColors.darkColor
                        : AppColors.whiteColor,
                    textColor: isDark
                        ? AppColors.whiteColor
                        : AppColors.labelColor,
                    border: Border.all(
                      width: 1.r,
                      color: isDark
                          ? AppColors.darkBorderColor
                          : AppColors.buttonBorderColor,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 12.w),
                  CustomPrimaryButton(
                    width: 140.w,
                    height: 40.h,
                    text: 'Apply',
                    onPressed: () {
                      final now = DateTime.now();
                      final today = DateTime(now.year, now.month, now.day);
                      final start = _rangeStart ?? today;
                      final end = _rangeEnd ?? _rangeStart ?? today;
                      _transactionController.applyDateRange(
                        rangeType: _selectedRangeType,
                        from: start,
                        to: end,
                      );
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateField({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.primaryBorderColor : AppColors.greyColor,
        ),
        SizedBox(height: 4.h),
        Container(
          height: 40.h,
          width: 110.w,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: isDark ? AppColors.labelColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              width: 1.r,
              color: isDark
                  ? AppColors.darkBorderColor
                  : AppColors.fieldBorderColorLight,
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomPrimaryText(
              text: value,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.whiteColor : AppColors.labelColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _rangeTypeList({required bool isDark}) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.labelColor : Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 1.r,
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.fieldBorderColorLight,
        ),
      ),
      child: ListView.builder(
        itemCount: _rangeOptions.length,
        itemBuilder: (context, index) {
          final title = _rangeOptions[index];
          final selected = title == _selectedRangeType;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedRangeType = title;
                _applyRangeType(title);
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: selected
                    ? isDark
                          ? AppColors.whiteColor
                          : Color(0xFFEFEFEF)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: CustomPrimaryText(
                text: title,
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: selected
                    ? isDark
                          ? AppColors.darkColor
                          : AppColors.labelColor
                    : isDark
                    ? AppColors.whiteColor
                    : AppColors.labelColor,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _monthHeader({required bool isDark}) {
    final offset = (_currentPageIndex - _initialPage) * 2;
    final leftMonth = _addMonths(_baseMonth, offset);
    final rightMonth = _addMonths(leftMonth, 1);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isDark ? AppColors.labelColor : Color(0xFFEAFBF6),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 1.r,
          color: isDark
              ? AppColors.darkBorderColor
              : AppColors.fieldBorderColorLight,
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
              );
            },
            child: Icon(
              Icons.chevron_left,
              size: 20.r,
              color: isDark ? AppColors.whiteColor : AppColors.labelColor,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPrimaryText(
                  text: _monthTitle(leftMonth),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                ),
                CustomPrimaryText(
                  text: _monthTitle(rightMonth),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          InkWell(
            onTap: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
              );
            },
            child: Icon(
              Icons.chevron_right,
              size: 20.r,
              color: isDark ? AppColors.whiteColor : AppColors.labelColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _calendarMonth({
    required BuildContext context,
    required bool isDark,
    required DateTime focusedMonth,
  }) {
    final firstDay = DateTime.utc(2000, 1, 1);
    final lastDay = DateTime.utc(2100, 12, 31);
    final focusedDay = DateTime(focusedMonth.year, focusedMonth.month, 15);
    final rangeHighlightColor = AppColors.primaryColor.withValues(alpha: 0.12);
    return TableCalendar(
      firstDay: firstDay,
      lastDay: lastDay,
      focusedDay: focusedDay,
      headerVisible: false,
      availableGestures: AvailableGestures.none,
      startingDayOfWeek: StartingDayOfWeek.monday,
      rangeStartDay: _rangeStart,
      rangeEndDay: _rangeEnd,
      rangeSelectionMode: RangeSelectionMode.toggledOn,
      onRangeSelected: (start, end, focused) {
        setState(() {
          _selectedRangeType = 'Custom';
          _rangeStart = start;
          _rangeEnd = end;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedRangeType = 'Custom';
          final day = DateTime(
            selectedDay.year,
            selectedDay.month,
            selectedDay.day,
          );
          if (_rangeStart == null || _rangeEnd != null) {
            _rangeStart = day;
            _rangeEnd = null;
            return;
          }
          final start = _rangeStart!;
          if (day.isBefore(start)) {
            _rangeStart = day;
            _rangeEnd = start;
          } else if (day.isAfter(start)) {
            _rangeEnd = day;
          } else {
            _rangeEnd = day;
          }
        });
      },
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.primaryBorderColor : AppColors.greyColor,
        ),
        weekendStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.primaryBorderColor : AppColors.greyColor,
        ),
        dowTextFormatter: (date, locale) {
          const labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
          return labels[date.weekday - 1];
        },
      ),
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        todayDecoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        defaultTextStyle: TextStyle(
          fontSize: 11.sp,
          color: isDark ? AppColors.whiteColor : AppColors.labelColor,
        ),
        weekendTextStyle: TextStyle(
          fontSize: 11.sp,
          color: isDark ? AppColors.whiteColor : AppColors.labelColor,
        ),
        rangeHighlightColor: rangeHighlightColor,
        withinRangeTextStyle: TextStyle(
          fontSize: 11.sp,
          color: isDark ? AppColors.whiteColor : AppColors.labelColor,
        ),
        rangeStartTextStyle: TextStyle(
          fontSize: 11.sp,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
        ),
        rangeEndTextStyle: TextStyle(
          fontSize: 11.sp,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
        ),
        rangeStartDecoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        rangeEndDecoration: BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  void _applyRangeType(String type) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    DateTime start;
    DateTime end;

    if (type == 'Custom') {
      start = _rangeStart ?? today;
      end = _rangeEnd ?? _rangeStart ?? today;
    } else if (type == 'Today') {
      start = today;
      end = today;
    } else if (type == 'Yesterday') {
      start = today.subtract(const Duration(days: 1));
      end = start;
    } else if (type == 'This Week') {
      start = today.subtract(Duration(days: today.weekday - 1));
      end = start.add(const Duration(days: 6));
    } else if (type == 'Last Week') {
      final thisWeekStart = today.subtract(Duration(days: today.weekday - 1));
      start = thisWeekStart.subtract(const Duration(days: 7));
      end = start.add(const Duration(days: 6));
    } else if (type == 'This Month') {
      start = DateTime(today.year, today.month, 1);
      end = DateTime(today.year, today.month + 1, 0);
    } else if (type == 'Last Month') {
      final lastMonth = DateTime(today.year, today.month - 1, 1);
      start = lastMonth;
      end = DateTime(lastMonth.year, lastMonth.month + 1, 0);
    } else if (type == 'This Year') {
      start = DateTime(today.year, 1, 1);
      end = DateTime(today.year, 12, 31);
    } else {
      start = DateTime(today.year - 1, 1, 1);
      end = DateTime(today.year - 1, 12, 31);
    }

    _rangeStart = start;
    _rangeEnd = end;
    _baseMonth = DateTime(start.year, start.month, 1);
    _currentPageIndex = _initialPage;
    _pageController.jumpToPage(_initialPage);
  }

  DateTime _addMonths(DateTime date, int months) {
    final year = date.year + ((date.month - 1 + months) ~/ 12);
    final month = ((date.month - 1 + months) % 12) + 1;
    return DateTime(year, month, 1);
  }

  String _monthTitle(DateTime monthStart) {
    const names = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${names[monthStart.month - 1]} ${monthStart.year}';
  }
}
