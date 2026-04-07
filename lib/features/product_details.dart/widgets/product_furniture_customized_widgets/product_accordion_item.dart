import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/product_details.dart/controller/products_attributes_controller.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_furniture_customized_widgets/attribute_options_list.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProductAccordionItem extends GetView<ProductAttributesController> {
  final int index;
  const ProductAccordionItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      if (controller.productsAttributes.value == null) return SizedBox.shrink();

      final attributes = controller.productsAttributes.value!.data;
      if (index >= attributes.length) return SizedBox.shrink();

      final attribute = attributes[index];
      final isExpanded = controller.isOpen[index];

      return Column(
        key: ValueKey('attribute_$index'),
        children: [
          GestureDetector(
            onTap: () => controller.toggleExpand(index),
            child: SharedContainer(
              radius: 12.r,
              border: Border.all(
                color: isDark ? AppColors.darkBorderColor : Color(0xFFE8E6EB),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildHeaderRow(isDark: isDark, attribute: attribute),
                        _buildExpandIcon(
                          isDark: isDark,
                          isExpanded: isExpanded,
                        ),
                      ],
                    ),
                  ),
                  _buildExpandedContent(isExpanded: isExpanded),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      );
    });
  }

  Widget _buildHeaderRow({required bool isDark, required dynamic attribute}) {
    return Row(
      children: [
        SharedContainer(
          padding: EdgeInsets.zero,
          height: 36.h,
          width: 36.w,
          radius: 8.r,
          border: Border.all(
            color: isDark ? AppColors.darkBorderColor : Color(0xFFE5E9EE),
          ),
          child: Center(
            child: Icon(
              Icons.category_outlined,
              size: 18.w,
              color: isDark ? AppColors.whiteColor : AppColors.labelColor,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        CustomPrimaryText(
          text: attribute.name,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
      ],
    );
  }

  Widget _buildExpandIcon({required bool isDark, required bool isExpanded}) {
    return AnimatedRotation(
      turns: isExpanded ? 0.5 : 0,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Image.asset(
        isExpanded ? IconsPath.upArrow : IconsPath.downArrow,
        height: 20.h,
        width: 20.w,
        color: isDark ? AppColors.whiteColor : AppColors.labelColor,
      ),
    );
  }

  Widget _buildExpandedContent({required bool isExpanded}) {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: Alignment.topLeft,
      child: isExpanded
          ? Padding(
              padding: EdgeInsets.only(top: 12.h, bottom: 12.h),
              child: AttributeOptionsList(attributeIndex: index),
            )
          : SizedBox.shrink(),
    );
  }
}
