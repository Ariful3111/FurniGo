import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignPreferenceLightingFloor
    extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreferenceLightingFloor({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: "Floor Finish",
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        Obx(() {
          return Column(
            children: List.generate(controller.floorList.length, (index) {
              final item = controller.floorList[index];
              final isSelected = controller.selectedFloorIndex.value == index;
              return GestureDetector(
                onTap: () => controller.selectedFloorIndex.value = index,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SharedContainer(
                      padding: EdgeInsets.zero,
                      height: 70.h,
                      radius: 12.r,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryColor
                            : (isDark
                                  ? AppColors.darkBorderColor
                                  : AppColors.borderColor),
                      ),
                      image: DecorationImage(
                        image: AssetImage(item['image']!),
                        fit: BoxFit.cover,
                      ),
                      child: isSelected
                          ? Align(
                              alignment: Alignment.topRight,
                              child: CustomCheckBox(
                                isChecked: isSelected,
                                onChange: (value) {
                                  controller.selectedFloorIndex.value = value;
                                },
                              ),
                            )
                          : null,
                    ),
                    SizedBox(height: 6.h),
                    CustomPrimaryText(
                      text: item['title']!,
                      fontSize: 12.sp,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.darkColor,
                    ),
                    SizedBox(
                      height: controller.wallList.length - 1 == index
                          ? 0
                          : 12.h,
                    ),
                  ],
                ),
              );
            }),
          );
        }),
      ],
    );
  }
}
