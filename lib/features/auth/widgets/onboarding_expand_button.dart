import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/auth/controller/onboarding_controller.dart';

class OnboardingExpandButton extends StatelessWidget {
  final bool isLast;
  const OnboardingExpandButton({super.key, required this.isLast});

  @override
  Widget build(BuildContext context) {
    OnboardingController onboardingController = Get.find();
    return Obx(
      () => Padding(
        padding: EdgeInsets.all(4.r),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: GestureDetector(
            onHorizontalDragUpdate: (details) =>
                onboardingController.updateDrag(details.delta.dx),
            onHorizontalDragEnd: (_) =>
                onboardingController.endDrag(isLast: isLast),
            child: Row(
              children: [
                FadeIn(
                  delay: Duration(milliseconds: 400),
                  child: Transform.translate(
                    offset: Offset(onboardingController.dragOffset.value.w, 0),
                    child: Container(
                      height: 52.h,
                      width: 52.w,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                        child: Image.asset(
                          IconsPath.home,
                          height: 22.h,
                          width: 22.w,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                ...List.generate(3, (index) {
                  return FadeIn(
                    delay: Duration(milliseconds: 800 + (index * 200)),
                    child: onboardingController.dragOffset < 20.w
                        ? Obx(() {
                            double opacity = onboardingController.syncOpacity(
                              index,
                            );
                            return ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (bounds) {
                                LinearGradient originalGradient =
                                    AppColors.primaryGradient as LinearGradient;
                                return LinearGradient(
                                  begin: originalGradient.begin,
                                  end: originalGradient.end,
                                  colors: originalGradient.colors
                                      .map((c) => c.withValues(alpha: opacity))
                                      .toList(),
                                ).createShader(bounds);
                              },
                              child: Icon(Icons.arrow_forward_ios, size: 12.sp),
                            );
                          })
                        : SizedBox(),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
