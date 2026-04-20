import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_view_widgets/transaction_calendar_dialog/selected_day.dart';
import 'package:zb_dezign/features/transaction/widgets/transaction_view_widgets/transaction_calendar_dialog/transaction_calender_header.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';

class CalenderFilter extends StatelessWidget {
  final Widget widget;
  final int isDay;
  final Function(int index) onTap;
  final AlignmentGeometry? alignmentGeometry;
  final VoidCallback onApply;
  const CalenderFilter({
    super.key,
    required this.widget,
    this.alignmentGeometry,
    required this.isDay,
    required this.onTap,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: alignmentGeometry ?? Alignment(0.5, -0.350),
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          padding: EdgeInsets.all(9.44.r),
          height: 390.h,
          width: MediaQuery.widthOf(context),
          decoration: BoxDecoration(
            color: isDark ? AppColors.whiteColor : AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4.72),
                blurRadius: 16.52,
                color: AppColors.shadowColor.withValues(alpha: 0.10),
              ),
            ],
            borderRadius: BorderRadius.circular(7.08.r),
          ),
          child: Column(
            children: [
              TransactionCalenderHeader(),
              CustomDivider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectDay(isDay: isDay, onTap: onTap),
                  SizedBox(width: 16.w),
                  Container(
                    width: 2.w,
                    height: 290.h,
                    color: isDark
                        ? AppColors.darkBorderColor
                        : AppColors.borderColor,
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 270.h,
                          width: MediaQuery.widthOf(context),
                          child: widget,
                        ),
                        SizedBox(height: 13.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomPrimaryButton(
                              fontSize: 10.sp,
                              borderRadius: BorderRadius.circular(6.7.r),
                              backgroundColor: AppColors.whiteColor,
                              border: Border.all(color: AppColors.primaryColor),
                              text: 'Cancel',
                              textColor: AppColors.primaryColor,
                              padding: EdgeInsets.symmetric(
                                vertical: 6.7.h,
                                horizontal: 13.39.w,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(width: 11.8),
                            CustomPrimaryButton(
                              fontSize: 10.sp,
                              borderRadius: BorderRadius.circular(6.7.r),
                              text: 'Apply',
                              padding: EdgeInsets.symmetric(
                                vertical: 6.7.h,
                                horizontal: 13.39.w,
                              ),
                              onPressed: onApply,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
