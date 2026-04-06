import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsOffer extends GetWidget<ProductDetailsController> {
  const ProductDetailsOffer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          controller.productDetails.value?.data.isInStock == true
              ? _deliveryCard(isDark)
              : ProductDetailsHelper().outOfStock(onTap: () {}, isDark: isDark),
          SizedBox(height: 12.h),
          _offerCard(isDark),
        ],
      ),
    );
  }

  Widget _deliveryCard(bool isDark) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: isDark ? Color(0xFF0E5843) : Color(0xFFE6FBF7),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isDark ? Color(0xFF179471) : Color(0xFF00DAB2),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 24.h,
            width: 24.w,
            alignment: Alignment.center,
            child: Image.asset(IconsPath.tag, height: 24.h, width: 24.w),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: CustomPrimaryText(
              text: '7-10 Days / Made to Order: 12-15 Days',
              fontSize: 16.sp,
              color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _offerCard(bool isDark) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: isDark ? Color(0xFF6B5A2B) : Color(0xFFFFFBF0),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isDark ? Color(0xFFB49948) : Color(0xFFFED766),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryText(
                  text: 'Special Offers',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.whiteColor : Color(0xFF6B5A2B),
                ),
                SizedBox(height: 12.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      IconsPath.offer,
                      height: 24.h,
                      width: 24.w,
                      color: isDark ? AppColors.whiteColor : null,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomPrimaryText(
                        text: 'Use Code: SAVE10 — Get 10% Off',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: isDark
                            ? AppColors.whiteColor
                            : Color(0xFF6B5A2B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: isDark ? Color(0xFFB49948) : Color(0xFFFFEDB9),
              borderRadius: BorderRadius.circular(60.r),
            ),
            child: Center(
              child: Image.asset(
                IconsPath.arrowRight,
                height: 24.h,
                width: 24.w,
                color: isDark ? AppColors.whiteColor : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
