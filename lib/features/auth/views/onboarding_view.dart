import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/auth/controller/onboarding_controller.dart';
import 'package:zb_dezign/features/auth/widgets/onboarding_footer.dart';
import 'package:zb_dezign/features/auth/widgets/onboarding_header.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController onboardingController = Get.find();
    return Scaffold(
      body: PageView.builder(
        controller: onboardingController.pageController,
        itemCount: onboardingController.onboardingItems.length,
        onPageChanged: (value) {
          onboardingController.currentIndex.value = value;
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = onboardingController.onboardingItems[index];
          return Container(
            height: MediaQuery.heightOf(context),
            width: MediaQuery.widthOf(context),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item['image']),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              children: [
                OnboardingHeader(),
                Spacer(),
                Obx(() {
                  final isLast =
                      onboardingController.currentIndex.value ==
                      onboardingController.onboardingItems.length - 1;
                  return OnboardingFooter(
                    title: item['title'],
                    subTitle: item['subTitle'],
                    isLast: isLast,
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
