import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/favorites/controller/favorites_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class FavoritesSelectItem extends GetWidget<FavoritesController> {
  const FavoritesSelectItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              controller.isMultiSelect.value = !controller.isMultiSelect.value;
            },
            child: Container(
              height: 40.h,
              padding: EdgeInsets.only( top: 10.h,bottom: 10.h,right: 16.w),
              decoration: ShapeDecoration(
                color: isDark ? AppColors.labelColor : AppColors.whiteColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.buttonBorderColor,
                  ),
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              child: Row(
                children: [
                  CustomCheckBox(
                    isChecked: controller.isMultiSelect.value,
                    onChange: (value) {
                      controller.isMultiSelect.value = value;
                    },
                  ),
                  CustomPrimaryText(
                    text: 'Select Multiple item',
                    fontSize: 14.sp,
                    color: isDark ? AppColors.whiteColor : AppColors.darkColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: ShapeDecoration(
                color: controller.isMultiSelect.value
                    ? AppColors.primaryColor
                    : AppColors.primaryColor.withValues(alpha: 0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPrimaryText(
                    text: 'Buy Now',
                    fontSize: 14.sp,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(width: 6.w),
                  Image.asset(
                    IconsPath.arrowRight,
                    height: 12.h,
                    width: 12.w,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
