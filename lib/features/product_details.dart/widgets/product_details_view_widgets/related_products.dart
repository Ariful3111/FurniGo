import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/product_details.dart/controller/related_products_controller.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/related_product_card.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RelatedProductsSection extends GetWidget<RelatedProductsController> {
  const RelatedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : controller.relatedProducts.value!.data.isEmpty
          ? SizedBox()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPrimaryText(
                        text: 'Related Products',
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.darkTextColor,
                      ),
                      InkWell(
                        onTap: () {},
                        child: CustomPrimaryText(
                          text: 'See All',
                          fontSize: 14.sp,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 240.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.relatedProducts.value!.data.length,
                      itemBuilder: (context, index) {
                        final product =
                            controller.relatedProducts.value!.data[index];
                        return Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: RelatedProductCard(
                            product: product,
                            isDark: isDark,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
