import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignPreferenceLightingTone extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreferenceLightingTone({super.key});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: "Lighting Tone",
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        Obx(() {
          return Row(
            children: List.generate(controller.toneList.length, (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: controller.toneList.length - 1 == index ? 0 : 16.w,
                  ),
                  child: GestureDetector(
                    onTap: () => controller.selectedToneIndex.value = index,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomRadioButton(
                              value: index,
                              groupValue: controller.selectedToneIndex.value,
                              onChange: (value) {
                                controller.selectedToneIndex.value = value;
                              },
                            ),
                            CustomPrimaryText(
                              text: controller.toneList[index],
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        SharedContainer(
                          height: 33.h,
                          radius: 8.r,
                          color: index == 0
                              ? AppColors.darkErrorBorder
                              : index == 1
                              ? AppColors.greyColor
                              : AppColors.activeTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ],
    );
  }
}