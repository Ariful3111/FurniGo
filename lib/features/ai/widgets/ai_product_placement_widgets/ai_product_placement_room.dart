import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_product.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiProductPlacementRoom extends GetWidget<AiProductPlacementController> {
  const AiProductPlacementRoom({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => AnimatedSize(
        duration: Duration(milliseconds: 300),
        child: controller.isProduct.value
            ? AiProductPlacementProduct()
            : Column(
                children: [
                  SharedContainer(
                    width: MediaQuery.widthOf(context),
                    padding: EdgeInsets.all(16.w),
                    color: isDark ? AppColors.labelColor : AppColors.boxColor,
                    border: Border.all(
                      color: isDark
                          ? AppColors.darkBorderColor
                          : AppColors.whiteBorderColor,
                    ),
                    radius: 20.r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomPrimaryText(
                          text: 'Select Your Room',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 12.h),
                        Wrap(
                          spacing: 8.w,
                          runSpacing: 8.h,
                          children: List.generate(controller.roomList.length, (
                            index,
                          ) {
                            final isSelected =
                                controller.selectedIndex.value == index;
                            return GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = index;
                              },
                              child: SharedContainer(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 29.w,
                                  vertical: 9.h,
                                ),
                                radius: 40.r,
                                color: isSelected
                                    ? isDark
                                          ? AppColors.boxColor
                                          : AppColors.primaryColor
                                    : isDark
                                    ? AppColors.primaryColor
                                    : AppColors.whiteColor,
                                child: CustomPrimaryText(
                                  text: controller.roomList[index],
                                  fontSize: 10.sp,
                                  color: isSelected
                                      ? isDark
                                            ? AppColors.darkColor
                                            : AppColors.whiteColor
                                      : isDark
                                      ? AppColors.boxColor
                                      : AppColors.primaryColor,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  GestureDetector(
                    onTap: () {
                      controller.isProduct.value = true;
                    },
                    child: SharedContainer(
                      width: 240.w,
                      height: 44.h,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      radius: 62.r,
                      color: controller.selectedIndex.value != -1
                          ? AppColors.primaryColor
                          : AppColors.whiteBorderColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomPrimaryText(
                            text: 'Place Your Product',
                            fontSize: 16.sp,
                            color: AppColors.whiteColor,
                          ),
                          SizedBox(width: 8.w),
                          Image.asset(
                            IconsPath.ai,
                            color: AppColors.whiteColor,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
