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

BoxShadow rentalShadow({
  required double y,
  required double blur,
  double? opacity,
  double? spreadRadius,
}) {
  return BoxShadow(
    offset: Offset(0, y),
    color: AppColors.shadowColor.withValues(alpha: opacity ?? 0.1),
    blurRadius: blur,
    spreadRadius: spreadRadius ?? 0,
  );
}

List<BoxShadow> buttonShadow = [
  rentalShadow(y: 2.72, blur: 6.11),
  rentalShadow(y: 10.87, blur: 10.87, opacity: 0.09),
  rentalShadow(y: 23.77, blur: 14.26, opacity: 0.05),
  rentalShadow(y: 42.79, blur: 16.98, opacity: 0.01),
  rentalShadow(y: 66.59, blur: 19.02, opacity: 0.00),
];

Widget text({required String text, required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: isDark ? AppColors.primaryBorderColor : AppColors.greyColor,
    );
  }