import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SubscriptionPlanPrice extends StatelessWidget {
  final Map<String, dynamic> data;
  const SubscriptionPlanPrice({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: data["title"],
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 20.h),
        CustomPrimaryText(
          text: 'Start at',
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
          fontSize: 14.sp,
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            CustomPrimaryText(
              text: data["price"],
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.darkColor,
            ),
            SizedBox(width: 4.w),
            CustomPrimaryText(
              text: "/Month",
              fontSize: 12.sp,
              color: AppColors.greyTextColor,
            ),
          ],
        ),
      ],
    );
  }
}