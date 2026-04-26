import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/auth/controller/onboarding_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_white_text.dart';
import 'package:zb_dezign/shared/widgets/glass_button.dart';

class OnboardingHeader extends GetWidget<OnboardingController> {
  /// Changes every page → forces animate_do to re-trigger entrance animations.
  final int pageKey;

  const OnboardingHeader({super.key, required this.pageKey});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final int page = controller.onboardingItems.length;

    return Row(
      children: [
        // ── Back button — slides in from left ──────────────────────────────
        Obx(() {
          final bool showBack = controller.currentIndex.value != 0;
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, anim) => FadeTransition(
              opacity: anim,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-0.5, 0),
                  end: Offset.zero,
                ).animate(anim),
                child: child,
              ),
            ),
            child: showBack
                ? FadeInLeft(
                    key: ValueKey('back_$pageKey'),
                    duration: const Duration(milliseconds: 400),
                    child: GlassButton(
                      height: 40.h,
                      width: 40.w,
                      radius: 100.r,
                      onTap: () {
                        if (controller.pageController.hasClients &&
                            controller.currentIndex.value > 0) {
                          controller.pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Image.asset(
                        IconsPath.onboardingBack,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                  )
                : SizedBox(width: 40.w, height: 40.h),
          );
        }),

        const Spacer(),

        // ── Logo + brand name — fade in from top ───────────────────────────
        FadeInDown(
          key: ValueKey('logo_$pageKey'),
          duration: const Duration(milliseconds: 500),
          child: Row(
            children: [
              Image.asset(
                isDark ? IconsPath.logoDark : IconsPath.logoLight,
                height: 40.h,
                width: 40.w,
              ),
              SizedBox(width: 8.w),
              CustomWhiteText(
                text: 'ZB DEZIGN',
                color: isDark ? AppColors.whiteColor : null,
              ),
            ],
          ),
        ),

        const Spacer(),

        // ── Skip button — fade in from right ───────────────────────────────
        Obx(() {
          final bool showSkip =
              controller.currentIndex.value != page - 1 &&
              controller.currentIndex.value != page - 2;
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, anim) => FadeTransition(
              opacity: anim,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.5, 0),
                  end: Offset.zero,
                ).animate(anim),
                child: child,
              ),
            ),
            child: showSkip
                ? FadeInRight(
                    key: ValueKey('skip_$pageKey'),
                    duration: const Duration(milliseconds: 400),
                    child: GlassButton(
                      height: 40.h,
                      width: 73.w,
                      radius: 18.r,
                      onTap: () {
                        if (controller.pageController.hasClients) {
                          controller.pageController.animateToPage(
                            page - 1,
                            duration: Duration(
                              milliseconds:
                                  controller.currentIndex.value == page - 3
                                  ? 500
                                  : 800,
                            ),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: CustomPrimaryText(
                        text: 'Skip',
                        fontSize: 16.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  )
                : SizedBox(width: 73.w, height: 40.h),
          );
        }),
      ],
    );
  }
}