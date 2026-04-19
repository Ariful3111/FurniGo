import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SelectDay extends StatelessWidget {
  final int isDay;
  final Function(int index) onTap;
  const SelectDay({super.key, required this.isDay, required this.onTap,});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    List dateList = [
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
      return Container(
        padding: EdgeInsets.symmetric(vertical: 7.08.h, horizontal: 9.44.w),
        width: 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.08.r),
          color: isDark ? AppColors.whiteColor : AppColors.whiteColor,
          border: Border.all(
            width: 0.69.r,
            color: isDark
                ? AppColors.whiteColor
                : AppColors.darkTextColor,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4.72),
              blurRadius: 16.52,
              color: AppColors.shadowColor.withValues(alpha: 0.10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(dateList.length, (index) {
            final selected = isDay == index;
            return GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                margin: EdgeInsets.only(bottom: index == dateList.length-1 ? 0 : 2.36.h,),
                padding: EdgeInsets.symmetric(
                  vertical: 4.46.h,
                  horizontal:10.04.w,
                ),
                decoration: BoxDecoration(
                  color: selected ? AppColors.fieldBorderColorLight : null,
                  borderRadius: BorderRadius.circular(selected ? 4.72.r : 0.r),
                ),
                child: CustomPrimaryText(
                  text: dateList[index],
                  fontSize: 9.44.sp,
                  color: selected
                      ? AppColors.darkTextColor
                      : isDark
                      ? AppColors.whiteColor
                      : AppColors.darkTextColor,
                      textOverflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }),
        ),
      );
  }
}