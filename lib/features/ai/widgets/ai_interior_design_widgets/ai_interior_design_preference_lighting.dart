import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_lighting_floor.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_lighting_tone.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_lighting_wall.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AiInteriorDesignPreferenceLighting
    extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreferenceLighting({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AiInteriorDesignPreferenceLightingTone(),
        SizedBox(height: 20.h),
        CustomPrimaryText(
          text: "Lighting Elements",
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        Obx(() {
          return Wrap(
            spacing: 16.w,
            runSpacing: 12.h,
            children: List.generate(controller.elementsList.length, (index) {
              final isSelected = controller.selectedElements[index];
              return GestureDetector(
                onTap: () {
                  controller.selectedElements[index] =
                      !controller.selectedElements[index];
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomCheckBox(
                      borderColor: AppColors.borderColor,
                      isChecked: isSelected,
                      onChange: (value) {
                        controller.selectedElements[index] = value;
                      },
                    ),
                    SizedBox(width: 6.w),
                    CustomPrimaryText(
                      text: controller.elementsList[index],
                      fontSize: 12.sp,
                    ),
                  ],
                ),
              );
            }),
          );
        }),
        SizedBox(height: 20.h),
        AiInteriorDesignPreferenceLightingWall(),
        SizedBox(height: 20.h),
        AiInteriorDesignPreferenceLightingFloor(),
      ],
    );
  }
}
