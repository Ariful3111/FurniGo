import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_shop_items.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_shop_selected_items.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiProductPlacementShop extends GetWidget<AiProductPlacementController> {
  const AiProductPlacementShop({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: List.generate(controller.roomList.length, (index) {
              final isSelected = controller.selectedShop.value == index;
              return GestureDetector(
                onTap: () {
                  controller.selectedShop.value = index;
                },
                child: SharedContainer(
                  padding: EdgeInsets.symmetric(
                    horizontal: 29.w,
                    vertical: 9.h,
                  ),
                  radius: 40.r,
                  color: isSelected
                      ?isDark? AppColors.boxColor:AppColors.primaryColor
                      :isDark? AppColors.primaryColor:AppColors.whiteColor,
                  child: CustomPrimaryText(
                    text: controller.roomList[index],
                    fontSize: 10.sp,
                    color: isSelected
                        ?isDark?AppColors.primaryColor :AppColors.whiteColor
                        :isDark? AppColors.boxColor:AppColors.primaryColor,
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: 20.h),
          AiProductPlacementShopItems(),
          SizedBox(height: 16.h),
          AiProductPlacementShopSelectedItems(),

        ],
      ),
    );
  }
}
