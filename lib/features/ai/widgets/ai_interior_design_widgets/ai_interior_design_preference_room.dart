import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_room_field.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference_room_type.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignPreferenceRoom
    extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreferenceRoom({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: "Room type",
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        AiInteriorDesignPreferenceRoomType(),
        SizedBox(height: 20.h),
        Obx(() {
          return Row(
            children: List.generate(controller.preference.length, (index) {
              final isSelected = controller.selectedPreference.value == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    controller.selectedPreference.value = index;
                  },
                  child: SharedContainer(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    margin: EdgeInsets.only(
                      right: controller.preference.length - 1 == index
                          ? 0
                          : 12.w,
                    ),
                    radius: 8.r,
                    border: Border.all(
                      color: isSelected
                          ? isDark
                                ? AppColors.boxColor
                                : AppColors.primaryColor
                          : isDark
                          ? AppColors.greyTextColor
                          : AppColors.darkPrimaryTextColor,
                    ),
                    child: Center(
                      child: CustomPrimaryText(
                        text: controller.preference[index],
                        fontSize: 12.sp,
                        color: isSelected
                            ? isDark
                                  ? AppColors.boxColor
                                  : AppColors.primaryColor
                            : isDark
                            ? AppColors.greyTextColor
                            : AppColors.darkPrimaryTextColor,
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        }),
        SizedBox(height: 20.h),
        CustomPrimaryText(
          text: "Room size",
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        AiInteriorDesignPreferenceRoomField(),
      ],
    );
  }
}
