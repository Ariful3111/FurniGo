import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/shop/controller/shop_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_rating/custom_rating_bar.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ShopSearchFilterReview extends GetWidget<ShopController> {
  const ShopSearchFilterReview({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: List.generate(controller.ratings.length, (index) {
        return Obx(() {
          return GestureDetector(
            onTap: () => controller.selectedRatingList[index] =
                !controller.selectedRatingList[index],
            child: Row(
              children: [
                CustomCheckBox(
                  isChecked: controller.selectedRatingList[index],
                  onChange: (value) =>
                      controller.selectedRatingList[index] = value,
                ),
                CustomRatingBar(
                  rating: controller.ratings[index],
                  itemSize: 16.sp,
                ),
                SizedBox(width: 8.w),
                CustomPrimaryText(
                  text: "${controller.ratings[index]} Star",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.lightTextColor,
                ),
              ],
            ),
          );
        });
      }),
    );
  }
}
