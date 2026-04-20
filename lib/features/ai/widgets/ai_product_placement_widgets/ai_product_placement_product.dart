import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_product_cart.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_product_cart_select.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_product_favorite.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_product_favorite_select.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_product_search.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_shop.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_shop_buttons.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiProductPlacementProduct
    extends GetWidget<AiProductPlacementController> {
  const AiProductPlacementProduct({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.centerLeft,
      child: Obx(
        () => SharedContainer(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          color: isDark ? AppColors.labelColor : AppColors.boxColor,
          border: Border.all(color: AppColors.whiteBorderColor),
          radius: 20.r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (controller.isProductExpand.value == -1)
                CustomPrimaryText(
                  text: 'Place your product',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              SizedBox(height: 12.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(controller.icon.length, (index) {
                  final item = controller.icon[index];
                  final selected = controller.isProductExpand.value == index;
                  return Padding(
                    padding: EdgeInsets.only(
                      right: controller.icon.length - 1 == index ? 0 : 12.w,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.isProductExpand.value = index;
                      },
                      child: SharedContainer(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.61.w,
                          vertical: 7.81.h,
                        ),
                        radius: 33.33.r,
                        color: isDark
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        child: AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          child: selected
                              ? item['title'] == 'Search'
                                    ? AiProductPlacementProductSearch()
                                          .aiPlacementField(
                                            controller:
                                                controller.searchController,
                                            isDark: isDark,
                                          )
                                    : Row(
                                        children: [
                                          CustomPrimaryText(
                                            text: item['title'],
                                            fontSize: 12.sp,
                                          ),
                                          SizedBox(width: 8.w),
                                          Image.asset(
                                            item['icon'],
                                            width: 20.w,
                                            height: 20.h,
                                            color: isDark
                                                ? AppColors.whiteColor
                                                : null,
                                          ),
                                        ],
                                      )
                              : Center(
                                  child: Image.asset(
                                    item['icon'],
                                    width: 20.w,
                                    height: 20.h,
                                    color: isDark ? AppColors.whiteColor : null,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              if (controller.isProductExpand.value == 0)
                AiProductPlacementShop(),
              if (controller.isProductExpand.value == 1)
                Column(
                  children: [
                    SizedBox(height: 20.h),
                    AiProductPlacementProductFavorite(),
                    SizedBox(height: 20.h),
                    AiProductPlacementProductFavoriteSelect(),
                  ],
                ),
              if (controller.isProductExpand.value == 2)
                Column(
                  children: [
                    SizedBox(height: 20.h),
                    AiProductPlacementProductCart(),
                    SizedBox(height: 20.h),
                    AiProductPlacementProductCartSelect(),
                  ],
                ),
              SizedBox(height: 16.h),
              if (controller.isProductExpand.value >= 0 &&
                      controller.shopSelectedItems.isNotEmpty ||
                  controller.favoriteSelectedItems.isNotEmpty ||
                  controller.cartSelectedItems.isNotEmpty)
                AiProductPlacementShopButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
