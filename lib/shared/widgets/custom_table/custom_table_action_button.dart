import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomTableActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? icon;
  const CustomTableActionButton({super.key, required this.onTap, this.icon});

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
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomPrimaryText(
                text: 'View Detail',
                fontSize: 12.sp,
                color: isDark ? AppColors.darkColor : AppColors.labelColor,
              ),
              SizedBox(width: 4.w),
              Image.asset(
               icon?? IconsPath.arrowRight,
                height: 16.h,
                width: 16.w,
                color: isDark ? AppColors.darkColor : AppColors.labelColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
