import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class SellFlowHelper {
  Widget myButton({
  BoxBorder? border,
  required VoidCallback onTap,
  Color? color,
  required Widget child,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: color ?? AppColors.whiteColor,
        borderRadius: BorderRadius.circular(100.r),
        border: border,
      ),
      child: child,
    ),
  );
}
}