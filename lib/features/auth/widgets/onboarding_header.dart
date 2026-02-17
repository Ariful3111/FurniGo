import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/auth/controller/onboarding_controller.dart';
import 'package:zb_dezign/features/auth/widgets/header_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_white_text.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({super.key});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;

    OnboardingController onboardingController = Get.find();
    final page = onboardingController.onboardingItems.length;
    return Row(
      children: [
        HeaderButton(
          height: 40.h,
          width: 40.w,
          radius: 100.r,
          onTap: () {
            if (onboardingController.pageController.hasClients &&
                onboardingController.currentIndex.value >= 0) {
              onboardingController.pageController.previousPage(
                duration: Duration(milliseconds: 300),
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
        Spacer(),
        Image.asset(IconsPath.header, height: 28.h, width: 28.w),
        SizedBox(width: 8.w),
        CustomWhiteText(text: 'ZB DEZIGN',color: isDark?AppColors.whiteColor:null,),
        Spacer(),
        Obx(
          () =>
              onboardingController.currentIndex.value ==
                  page - 1
              ? SizedBox()
              : HeaderButton(
                  height: 40.h,
                  width: 73.w,
                  radius: 18.r,
                  onTap: () {
                    if (onboardingController.pageController.hasClients) {
                      onboardingController.pageController.animateToPage(
                        page - 1,
                        duration: Duration(milliseconds:onboardingController.currentIndex.value==page-3?500 :onboardingController.currentIndex.value==page-2? 300:800),
                        curve: Curves.linear,
                      );
                    }
                  },
                  child: CustomPrimaryText(
                    text: 'Skip',
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
        ),
      ],
    );
  }
}
