import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignPreferenceFurniture
    extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreferenceFurniture({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Key Furniture Items',
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),

        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4.5,
          ),
          itemCount: controller.furnitureItems.length,
          itemBuilder: (context, index) {
            return Obx(() {
              final item = controller.furnitureItems[index];
              final isSelected = controller.selectedItems.contains(item);
              return GestureDetector(
                onTap: () {
                  if (controller.selectedItems.contains(item)) {
                    controller.selectedItems.remove(item);
                  } else {
                    controller.selectedItems.add(item);
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomCheckBox(
                      borderColor: AppColors.borderColor,
                      isChecked: isSelected,
                      onChange: (value) {
                        if (controller.selectedItems.contains(item)) {
                          controller.selectedItems.remove(item);
                        } else {
                          controller.selectedItems.add(item);
                        }
                      },
                    ),
                    CustomPrimaryText(
                      text: item,
                      fontSize: 12.sp,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.darkColor,
                    ),
                  ],
                ),
              );
            });
          },
        ),
        SizedBox(height: 20.h),
        CustomPrimaryText(
          text: 'Keep existing furniture?',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 12.h),
        Obx(() {
          return Row(
            children: ['Yes', 'No'].map((value) {
              final isSelected = controller.keepExisting.value == value;
              return Expanded(
                child: GestureDetector(
                  onTap: () => controller.keepExisting.value = value,
                  child: SharedContainer(
                    margin: EdgeInsets.only(right: value == 'Yes' ? 8.w : 0),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    radius: 8.r,
                    border: Border.all(
                      width: 1,
                      color: isSelected
                          ?isDark? AppColors.boxColor:AppColors.primaryColor
                          : (isDark
                                ? AppColors.greyTextColor
                                : AppColors.borderColor),
                    ),
                    child: Center(
                      child: CustomPrimaryText(
                        text: value,
                        fontSize: 12.sp,
                        color: isSelected
                            ?isDark? AppColors.boxColor:AppColors.primaryColor
                            : (isDark
                                  ? AppColors.greyTextColor
                                  : AppColors.darkColor),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}
