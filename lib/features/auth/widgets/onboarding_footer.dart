import 'package:animate_do/animate_do.dart';
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

  /// Changing this triggers all animate_do entrance animations again.
  final int pageKey;

  const OnboardingFooter({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isLast,
    required this.pageKey,
  });

  static const List<Shadow> _textShadow = [
    Shadow(
      offset: Offset(0, 4),
      blurRadius: 4,
      color: Color(0x40000000),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Title — slides up from below ─────────────────────────────────
        FadeInUp(
          key: ValueKey('title_$pageKey'),
          duration: const Duration(milliseconds: 500),
          from: 30,
          child: CustomPrimaryText(
            text: title,
            fontSize: 34.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteColor,
            textAlign: TextAlign.center,
            shadow: _textShadow,
          ),
        ),

        SizedBox(height: 11.h),

        // ── Subtitle / login panel — slides up with stagger delay ─────────
        AnimatedSize(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          child: isLast
              ? FadeInUp(
                  key: ValueKey('login_$pageKey'),
                  duration: const Duration(milliseconds: 500),
                  delay: const Duration(milliseconds: 150),
                  from: 30,
                  child: OnboardLogin(
                    subTitle: subTitle,
                    valueKey: ValueKey('login'),
                  ),
                )
              : Column(
                  key: ValueKey('next_$pageKey'),
                  children: [
                    // Subtitle
                    FadeInUp(
                      key: ValueKey('sub_$pageKey'),
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 100),
                      from: 24,
                      child: CustomPrimaryText(
                        text: subTitle,
                        fontSize: 14.sp,
                        color: AppColors.whiteColor,
                        textAlign: TextAlign.center,
                        shadow: _textShadow,
                      ),
                    ),
                    SizedBox(height: 38.h),

                    // Slider dots + button
                    FadeInUp(
                      key: ValueKey('slider_$pageKey'),
                      duration: const Duration(milliseconds: 500),
                      delay: const Duration(milliseconds: 220),
                      from: 20,
                      child: OnboardingSlider(isLast: isLast),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}