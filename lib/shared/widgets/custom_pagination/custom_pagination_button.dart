import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CustomPaginationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const CustomPaginationButton({super.key, required this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.56.h,
        width: 40.56.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          icon,
          size: 24.sp,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}