import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignPreferenceLightingWall
    extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreferenceLightingWall({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: "Wall Finish",
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        Obx(() {
          return Column(
            children: List.generate(controller.wallList.length, (index) {
              final item = controller.wallList[index];
              final isSelected = controller.selectedWallIndex.value == index;
              return GestureDetector(
                onTap: () => controller.selectedWallIndex.value = index,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SharedContainer(
                      padding: EdgeInsets.zero,
                      height: 70.h,
                      radius: 12.r,
                      margin: EdgeInsets.only(bottom: 6.h),
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
                                  controller.selectedWallIndex.value = value;
                                },
                              ),
                            )
                          : null,
                    ),
                    CustomPrimaryText(text: item['title']!, fontSize: 12.sp),
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
