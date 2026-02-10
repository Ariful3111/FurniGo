import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class ActionButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const ActionButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.27.r),
        height: 32.h,width: 32.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(width: 1.03.r, color: AppColors.primaryBorderColor),
          borderRadius: BorderRadius.circular(4.65.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1.03),
              blurRadius: 2.07,
              color: Color(0xFF525866).withValues(alpha: 0.06),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(icon, height: 16.w, width: 16.w),
        ),
      ),
    );
  }
}
