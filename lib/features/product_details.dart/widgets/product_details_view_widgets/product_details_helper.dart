import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsHelper {
  Widget outOfStock({required VoidCallback onTap, required bool isDark}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Color(0xFFFFEBEB),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Color(0xFFEC1010)),
        ),
        child: Row(
          children: [
            Image.asset(
              IconsPath.errorOrder,
              height: 24.sp,
              width: 24.sp,
              color: Color(0xFFEC1010),
            ),
            SizedBox(width: 10.w),
            CustomPrimaryText(
              text: 'Out of Stock',
              fontSize: 14.sp,
              color: Color(0xFFEC1010),
            ),
          ],
        ),
      ),
    );
  }

  Widget reStock({required VoidCallback onTap, required bool isDark}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPrimaryText(
              text: 'REQUEST FOR RESTOCK',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.whiteColor,
            ),
            SizedBox(width: 8.w),
            Image.asset(
              IconsPath.activeOrder,
              height: 24.sp,
              width: 24.sp,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
