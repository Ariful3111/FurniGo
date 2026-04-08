import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsDescription extends GetWidget<ProductDetailsController> {
  const ProductDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPrimaryText(
                      text: controller.productDetails.value?.data.name ?? '',
                      fontWeight: FontWeight.w600,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Image.asset(
                          IconsPath.rating,
                          height: 18.h,
                          width: 18.w,
                        ),
                        SizedBox(width: 8.w),
                        CustomPrimaryText(
                          text:
                              controller.productDetails.value?.data.totalReviews
                                  .toString() ??
                              '',
                          fontSize: 14.sp,
                          color: isDark
                              ? AppColors.darkPrimaryTextColor
                              : AppColors.buttonTextColor,
                        ),
                        SizedBox(width: 14.w),
                        CustomPrimaryText(
                          text:
                              '${controller.productDetails.value?.data.totalReviews} Reviews',
                          fontSize: 14.sp,
                          color: isDark
                              ? AppColors.darkPrimaryTextColor
                              : AppColors.buttonTextColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
              CustomPrimaryText(
                text:
                    '\$${controller.productDetails.value?.data.finalPrice.toDouble().toPrecision(2)}',
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                textOverflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          CustomPrimaryText(
            text: '${controller.productDetails.value?.data.description}',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? AppColors.boxColor : Color(0xFF62547C),
          ),
        ],
      ),
    );
  }
}
