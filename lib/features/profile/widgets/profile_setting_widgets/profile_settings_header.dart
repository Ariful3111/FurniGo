import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProfileSettingsHeader extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final Widget? button;
  const ProfileSettingsHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Image.asset(
          icon,
          height: 24.h,
          width: 24.w,
          color: isDark ? AppColors.whiteColor : AppColors.labelColor,
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPrimaryText(
              text: title,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
            ),
            SizedBox(height: 6.h),
            CustomPrimaryText(
              text: subtitle,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: isDark ? AppColors.primaryBorderColor : Color(0xFF6B7280),
            ),
          ],
        ),
        Spacer(),
        ?button,
      ],
    );
  }
}
