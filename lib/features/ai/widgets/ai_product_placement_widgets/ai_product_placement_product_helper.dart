import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class AiProductPlacementProductHelper {
  Widget arrowButton(IconData icon, bool isDark) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: isDark ? AppColors.darkBorderColor : AppColors.whiteColor,
        border: Border.all(color: AppColors.whiteColor)
      ),
      child: Icon(
        icon,
        size: 16.sp,
        color: isDark ? AppColors.whiteColor : AppColors.darkColor,
      ),
    );
  }
}
