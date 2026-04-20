import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/shop/controller/shop_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ShopSearchFilterPrice extends GetWidget<ShopController> {
  const ShopSearchFilterPrice({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h,),
          CustomPrimaryText(
            text:
                '\$${controller.minPrice.value.toInt()} — \$${controller.maxPrice.value.toInt()}',
            fontSize: 14.sp,
            color: isDark
                ? AppColors.primaryBorderColor
                : AppColors.lightTextColor,
          ),
          SizedBox(height: 12.h),
          RangeSlider(
            values: RangeValues(
              controller.minPrice.value,
              controller.maxPrice.value,
            ),
            min: controller.minLimit,
            max: controller.maxLimit,
            divisions: 100,
            activeColor: AppColors.primaryColor,
            inactiveColor: isDark
                ? AppColors.primaryBorderColor
                : AppColors.fieldBorderColor,
            onChanged: (value) {
              controller.minPrice.value = value.start;
              controller.maxPrice.value = value.end;
            },
          ),
        ],
      );
    });
  }
}
