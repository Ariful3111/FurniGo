import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_mood_color.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_mood_style.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignPreferenceMood
    extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreferenceMood({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AiInteriorDesignPreferenceMoodStyle(),
        SizedBox(height: 20.h),
        AiInteriorDesignPreferenceMoodColor(),
        SizedBox(height: 20.h),
        CustomPrimaryText(
          text: "Material Preference",
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        Obx(() {
          return Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: List.generate(controller.materials.length, (index) {
              final isSelected = controller.selectedMaterials.contains(index);
              return GestureDetector(
                onTap: () {
                  if (controller.selectedMaterials.contains(index)) {
                    controller.selectedMaterials.remove(index);
                  } else {
                    controller.selectedMaterials.add(index);
                  }
                },
                child: SharedContainer(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  radius: 8.r,
                  color: isSelected
                      ?isDark? AppColors.boxColor:AppColors.primaryColor
                      : (isDark ? AppColors.primaryColor : AppColors.fieldColor),
                
                  child: CustomPrimaryText(
                    text: controller.materials[index],
                    fontSize: 12.sp,
                    color: isSelected
                        ?isDark?AppColors.darkColor :AppColors.whiteColor
                        :isDark? AppColors.whiteColor:AppColors.darkColor,
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
