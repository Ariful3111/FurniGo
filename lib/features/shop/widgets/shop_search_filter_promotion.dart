import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/shop/controller/shop_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ShopSearchFilterPromotion extends GetWidget<ShopController> {
  const ShopSearchFilterPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        itemCount: controller.promotion.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Obx(
            () => GestureDetector(
              onTap: () {
                controller.isCheckedPromotion[index] =
                    !controller.isCheckedPromotion[index];
              },
              child: Row(
                children: [
                  CustomCheckBox(
                    borderColor: AppColors.primaryBorderColor,
                    isChecked: controller.isCheckedPromotion[index],
                    onChange: (value) {
                      controller.isCheckedPromotion[index] = value;
                    },
                  ),
                  Expanded(
                    child: CustomPrimaryText(
                      text: controller.promotion[index],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColors.primaryBorderColor
                          : AppColors.lightTextColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
