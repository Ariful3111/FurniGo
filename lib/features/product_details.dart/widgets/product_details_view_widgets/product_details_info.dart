import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/extensions/formatters/dimension_formatter.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.find<ProductDetailsController>();
    final dimensionsData = controller.productDetails.value?.data.dimensions;
    final dimensionsMap = DimensionFormatter.parseDimensions(dimensionsData);
    final dimensions = DimensionFormatter.toList(dimensionsMap);

    if (dimensions.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Product Dimensions',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 16.h),
          CustomPrimaryText(
            text: 'No dimensions available',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark
                ? AppColors.primaryBorderColor
                : AppColors.lightTextColor,
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Product Dimensions',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 16.h),
        Column(
          children: List.generate(
            dimensions.length,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomPrimaryText(
                      text: dimensions[index]["title"]!,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColors.primaryBorderColor
                          : AppColors.lightTextColor,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomPrimaryText(
                      text: dimensions[index]["value"]!,
                      textAlign: TextAlign.right,
                      fontSize: 16.sp,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.buttonTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
