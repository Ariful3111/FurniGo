import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomTableActionButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomTableActionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border: Border.all(color:isDark? AppColors.darkBorderColor:AppColors.buttonBorderColor, width: 1.r),
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
                color:isDark?AppColors.darkColor: AppColors.labelColor,
              ),
              SizedBox(width: 4.w),
              Icon(
                Icons.arrow_forward,
                size: 14.sp,
                color:isDark? AppColors.darkColor:AppColors.labelColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
