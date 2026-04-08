import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/product_details.dart/controller/products_attributes_controller.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_furniture_customized_widgets/product_accordion_item.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductFurnitureCustomizedWidgets
    extends GetView<ProductAttributesController> {
  const ProductFurnitureCustomizedWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value ||
          controller.productsAttributes.value == null) {
        return ButtonLoading();
      }

      final attributes = controller.productsAttributes.value!.data;

      if (attributes.isEmpty) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(32.w),
            child: CustomPrimaryText(
              text: 'No attributes available',
              fontSize: 14.sp,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.primaryBorderColor
                  : AppColors.lightTextColor,
            ),
          ),
        );
      }

      return Column(
        children: List.generate(attributes.length, (index) {
          return ProductAccordionItem(index: index);
        }),
      );
    });
  }
}
