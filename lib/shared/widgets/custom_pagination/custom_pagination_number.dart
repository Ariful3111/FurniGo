import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPaginationNumber extends StatelessWidget {
  final int page;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomPaginationNumber({
    super.key,
    required this.page,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width: 32.w,
        margin: EdgeInsets.symmetric(horizontal: 6.73.w),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.whiteBorderColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: CustomPrimaryText(
            text: page.toString(),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
