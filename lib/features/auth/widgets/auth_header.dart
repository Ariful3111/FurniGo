import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            height: 40.h,
            width: 40.w,
            child: Center(
              child: Image.asset(
                IconsPath.onboardingBack,
                height: 20.h,
                width: 20.w,
                color: isDark ? null : AppColors.primaryColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 54.h),
        Row(
          children: [
            Image.asset(
              isDark ? IconsPath.logoDark : IconsPath.logoLight,
              height: 28.h,
              width: 28.w,
            ),
            SizedBox(width: 18.w),
            CustomPrimaryText(
              text: 'ZB DEZIGN',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }
}
