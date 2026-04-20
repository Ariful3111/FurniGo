import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/product_details.dart/controller/products_attributes_controller.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_furniture_customized_widgets/attribute_option_chip.dart';

class AttributeOptionsList extends GetView<ProductAttributesController> {
  final int attributeIndex;
  const AttributeOptionsList({super.key, required this.attributeIndex});

  @override
  Widget build(BuildContext context) {
    final attribute = controller.productsAttributes.value!.data[attributeIndex];

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 12.w,
        runSpacing: 12.h,
        alignment: WrapAlignment.start,
        children: List.generate(attribute.options?.length ?? 0, (optionIndex) {
          final option = attribute.options![optionIndex];
          return AttributeOptionChip(
            attributeIndex: attributeIndex,
            optionIndex: optionIndex,
            option: option,
          );
        }),
      ),
    );
  }
}
