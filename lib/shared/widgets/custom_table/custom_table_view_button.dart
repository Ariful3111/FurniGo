import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class CustomTableViewButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? icon;
  const CustomTableViewButton({super.key, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.buttonBorderColor,
            width: 1.r,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Image.asset(
         icon?? IconsPath.view,
          height: 16.h,
          width: 16.w,
          color: isDark ? AppColors.darkColor : AppColors.labelColor,
        ),
      ),
    );
  }
}
