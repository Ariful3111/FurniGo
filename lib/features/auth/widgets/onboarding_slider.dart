import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/auth/controller/onboarding_controller.dart';
import 'package:zb_dezign/features/auth/widgets/onboarding_expand_button.dart';

class OnboardingSlider extends StatelessWidget {
  final bool isLast;
  const OnboardingSlider({super.key, required this.isLast});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    OnboardingController onboardingController = Get.find();
    return Obx(() {
      final isSecondLast =
          onboardingController.currentIndex.value ==
          onboardingController.onboardingItems.length - 2;
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(
              onboardingController.onboardingItems.length - 1,
              (index) {
                bool isSelected =
                    onboardingController.currentIndex.value == index;
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.only(
                    right:
                        onboardingController.onboardingItems.length - 1 == index
                        ? 0
                        : 4.w,
                  ),
                  height: 6.h,
                  width: isSelected ? 24.w : 14.w,
                  decoration: BoxDecoration(
                    gradient: isDark
                        ? AppColors.darkPrimaryGradient.withOpacity(
                            isSelected ? 1 : 0.75,
                          )
                        : AppColors.primaryGradient.withOpacity(
                            isSelected ? 1 : 0.75,
                          ),
                    borderRadius: BorderRadius.circular(
                      isSecondLast ? 32.r : 2.r,
                    ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onboardingController.pageController.hasClients && !isLast) {
                onboardingController.pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.linearToEaseOut,
              height: 60.h,
              width: isSecondLast ? 106.w : 60.w,
              decoration: BoxDecoration(
                gradient: isDark
                    ?isSecondLast?LinearGradient(
                        colors: [AppColors.whiteColor, AppColors.whiteColor],
                      ) :AppColors.darkPrimaryGradient
                    : LinearGradient(
                        colors: [AppColors.whiteColor, AppColors.whiteColor],
                      ),
                borderRadius: BorderRadius.circular(24.r),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 15.88),
                    blurRadius: 27.35,
                    color: isDark
                        ? Color(0xFF4F10BD).withValues(alpha: 0.25)
                        : Color(0xFF4F10BD).withValues(alpha: 0.25),
                  ),
                ],
              ),
              child: isSecondLast
                  ? OnboardingExpandButton(isLast: isLast)
                  : Center(
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (bounds) {
                          return isDark
                              ? LinearGradient(
                                  colors: [
                                    AppColors.whiteColor,
                                    AppColors.whiteColor,
                                  ],
                                ).createShader(
                                  Rect.fromLTWH(
                                    0,
                                    0,
                                    bounds.width,
                                    bounds.height,
                                  ),
                                )
                              : AppColors.primaryGradient.createShader(
                                  Rect.fromLTWH(
                                    0,
                                    0,
                                    bounds.width,
                                    bounds.height,
                                  ),
                                );
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          size: 25.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      );
    });
  }
}
