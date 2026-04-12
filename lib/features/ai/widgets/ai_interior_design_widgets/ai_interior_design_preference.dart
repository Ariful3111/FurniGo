import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignPreference extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreference({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      padding: EdgeInsets.all(16.r),
      radius: 20.r,
      color: isDark ? AppColors.labelColor : AppColors.boxColor,
      border: Border.all(color: AppColors.whiteBorderColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Select your preference',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.darkColor,
          ),
          SizedBox(height: 12.h),
          Obx(() {
            return Column(
              children: List.generate(controller.sections.length, (index) {
                final item = controller.sections[index];
                final isExpanded = controller.isExpanded(index);
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: SharedContainer(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    radius: 16.r,
                    color: isDark ? AppColors.darkColor : AppColors.whiteColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomPrimaryText(
                              text: item['title'],
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? AppColors.whiteColor
                                  : AppColors.darkColor,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (controller.expandedIndexes.contains(
                                  index,
                                )) {
                                  controller.expandedIndexes.remove(index);
                                } else {
                                  controller.expandedIndexes.add(index);
                                }
                              },
                              child: AnimatedRotation(
                                duration: Duration(milliseconds: 300),
                                turns: isExpanded ? 0.5 : 1,
                                child: Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  size: 20.sp,
                                  color: isDark
                                      ? AppColors.whiteColor
                                      : AppColors.darkColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: isExpanded
                              ? Column(
                                  children: [
                                    CustomDivider(),
                                    SizedBox(height: 12.h),
                                    item['widget'],
                                  ],
                                )
                              : SizedBox(),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          }),
        ],
      ),
    );
  }
}
