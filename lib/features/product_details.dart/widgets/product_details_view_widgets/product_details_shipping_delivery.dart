import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsShippingDelivery extends StatelessWidget {
  const ProductDetailsShippingDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.labelColor
            : const Color(0xFFF2F0F5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(child: Image.asset(IconsPath.deliveryVan, height: 20.h, width: 20.w)),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryText(
                  text: "Standard Delivery",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: 6.h),
                CustomPrimaryText(
                  text:
                      "Free for orders over \$500. Doorstep delivery included.",
                  fontSize: 14.sp,
                  color: isDark
                      ? AppColors.secondaryTextColor
                      :  Color(0xFF62547C),
                ),
                SizedBox(height: 8.h),
                CustomPrimaryText(
                  text: "Est: Oct 24 - Oct 26",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}