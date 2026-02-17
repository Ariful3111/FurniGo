import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

Widget rentalsTop({required bool isDark}) {
  return SharedContainer(
    padding: EdgeInsets.all(12.r),
    radius: 12.r,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(text: 'Rentals'),
        SizedBox(height: 4.h),
        CustomPrimaryText(
          text: 'Manage your rental subscriptions and requests.',
          color: isDark
              ? AppColors.primaryBorderColor
              : AppColors.secondaryTextColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    ),
  );
}
