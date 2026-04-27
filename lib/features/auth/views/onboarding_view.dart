import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/auth/controller/onboarding_controller.dart';
import 'package:zb_dezign/features/auth/widgets/onboarding_footer.dart';
import 'package:zb_dezign/features/auth/widgets/onboarding_header.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  static const double _parallaxFactor = 0.28;

  @override
  Widget build(BuildContext context) {
    final double screenW = MediaQuery.sizeOf(context).width;
    final double screenH = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: PageView.builder(
        controller: controller.pageController,
        itemCount: controller.onboardingItems.length,
        onPageChanged: (value) => controller.currentIndex.value = value,
        itemBuilder: (context, index) {
          final item = controller.onboardingItems[index];
          return AnimatedBuilder(
            animation: controller.pageController,
            builder: (context, _) {
              final double page = controller.pageController.hasClients
                  ? (controller.pageController.page ?? index.toDouble())
                  : index.toDouble();
              final double bgOffset =
                  (index - page) * screenW * _parallaxFactor;
              return Stack(
                children: [
                  ClipRect(
                    child: OverflowBox(
                      maxWidth: screenW * (1 + _parallaxFactor * 2),
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: Offset(bgOffset, 0),
                        child: Image.asset(
                          item['image'] as String,
                          width: screenW * (1 + _parallaxFactor * 2),
                          height: screenH,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 40.h,
                    ),
                    child: Column(
                      children: [
                        Obx(
                          () => OnboardingHeader(
                            pageKey: controller.currentIndex.value,
                          ),
                        ),
                        Spacer(),
                        Obx(() {
                          final isLast =
                              controller.currentIndex.value ==
                              controller.onboardingItems.length - 1;
                          return OnboardingFooter(
                            title: item['title'] as String,
                            subTitle: item['subTitle'] as String,
                            isLast: isLast,
                            pageKey: controller.currentIndex.value,
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
