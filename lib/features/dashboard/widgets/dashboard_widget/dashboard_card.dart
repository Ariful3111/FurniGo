import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String sub;
  final String time;
  final String icon;
  final bool isLastIndex;
  final Widget button;
  const DashboardCard({
    super.key,
    required this.title,
    required this.sub,
    required this.time,
    required this.icon,
    required this.isLastIndex, required this.button,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      radius: 12.r,
      border: Border.all(
        width: 1.r,
        color: isDark ? AppColors.darkBorderColor : Color(0xFFEBEDF0),
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 8),
          blurRadius: 28,
          color: AppColors.shadowColor.withValues(alpha: 0.1),
        ),
      ],
      margin: EdgeInsets.only(bottom: isLastIndex ? 0 : 12.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                icon,
                height: 24.h,
                width: 24.w,
                color: isDark
                    ? AppColors.whiteColor
                    : AppColors.secondaryTextColor,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPrimaryText(
                      text: title,
                      fontSize: 16.sp,
                      color: isDark ? AppColors.whiteColor : Color(0xFF091E42),
                    ),
                    SizedBox(height: 4.h),
                    CustomPrimaryText(
                      text: sub,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColors.primaryBorderColor
                          : AppColors.primaryGreyTextColor,
                    ),
                    SizedBox(height: 4.h),
                    CustomPrimaryText(
                      text: time,
                      fontSize: 12.sp,
                      color: isDark
                          ? AppColors.primaryBorderColor
                          : AppColors.labelColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          button,
        ],
      ),
    );
  }
}
