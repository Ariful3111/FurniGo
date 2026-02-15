import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/auth/widgets/onboard_login.dart';
import 'package:zb_dezign/features/auth/widgets/onboarding_slider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class OnboardingFooter extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isLast;
  const OnboardingFooter({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 34.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.whiteColor,
          textAlign: TextAlign.center,
          shadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: AppColors.darkColor.withValues(alpha: 0.25),
            ),
          ],
        ),
        SizedBox(height: 11.h),
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,

          child: isLast
              ? OnboardLogin(subTitle: subTitle, valueKey: ValueKey('login'))
              : Column(
                  key: ValueKey('next'),
                  children: [
                    CustomPrimaryText(
                      text: subTitle,
                      fontSize: 14.sp,
                      color: AppColors.whiteColor,
                      textAlign: TextAlign.center,
                      shadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: AppColors.darkColor.withValues(alpha: 0.25),
                        ),
                      ],
                    ),
                    SizedBox(height: 38.h),
                    OnboardingSlider(isLast: isLast,),
                  ],
                ),
        ),
      ],
    );
  }
}
