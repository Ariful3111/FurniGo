import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String title;
  final Color? color;
  final Color? fontColor;
  final Color? borderColor;
  final double? radius;
  final Color? iconColor;
  const LoginButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.color,
    this.fontColor,
    this.borderColor,
    this.radius, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        height: 48.h,
        decoration: BoxDecoration(
          color: isDark
              ? color ?? AppColors.darkColor
              : color ?? AppColors.whiteColor,
          borderRadius: BorderRadius.circular(radius ?? 60.r),
          border: Border.all(
            width: 1.r,
            color: isDark
                ? borderColor ?? AppColors.darkBorderColor
                : borderColor ?? AppColors.grayBorderColor,
          ),
        ),
        child: Row(
          children: [
            Image.asset(icon, height: 20.h, width: 20.w, color: iconColor),
            SizedBox(width: 80.w),
            CustomPrimaryText(
              text: title,
              fontSize: 16.sp,
              color: isDark
                  ? fontColor ?? AppColors.whiteColor
                  : fontColor ?? AppColors.buttonTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
