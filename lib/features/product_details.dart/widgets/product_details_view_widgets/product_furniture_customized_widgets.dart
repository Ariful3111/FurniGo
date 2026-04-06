import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProductFurnitureCustomizedWidgets
    extends GetView<ProductDetailsController> {
  const ProductFurnitureCustomizedWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(controller.items.length, (index) {
        return ProductAccordionItem(index: index);
      }),
    );
  }
}

class ProductAccordionItem extends GetView<ProductDetailsController> {
  final int index;
  const ProductAccordionItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      final isExpanded = controller.isOpen[index];
      final item = controller.items[index];

      return Column(
        key: ValueKey('item_$index'),
        children: [
          SharedContainer(
            radius: 12.r,
            border: Border.all(
              color: isDark ? AppColors.darkBorderColor : Color(0xFFE8E6EB),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SharedContainer(
                          padding: EdgeInsets.zero,
                          height: 36.h,
                          width: 36.w,
                          radius: 8.r,
                          border: Border.all(
                            color: isDark
                                ? AppColors.darkBorderColor
                                : Color(0xFFE5E9EE),
                          ),
                          child: Center(
                            child: Image.asset(
                              item['icon'],
                              height: 16.h,
                              width: 16.w,
                              color: isDark
                                  ? AppColors.whiteColor
                                  : AppColors.labelColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        CustomPrimaryText(
                          text: item['title'],
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.darkTextColor,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.isOpen[index] = !controller.isOpen[index];
                      },
                      child: AnimatedRotation(
                        turns: isExpanded ? 0.5 : 0,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Image.asset(
                          isExpanded ? IconsPath.upArrow : IconsPath.downArrow,
                          height: 20.h,
                          width: 20.w,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.labelColor,
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedSize(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  alignment: Alignment.topCenter,
                  child: isExpanded
                      ? Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Column(
                            key: ValueKey('widgets_$index'),
                            children: [item['widgets']],
                          ),
                        )
                      : SizedBox.shrink(),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
        ],
      );
    });
  }
}
