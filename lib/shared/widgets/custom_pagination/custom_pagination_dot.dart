import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPaginationDot extends StatelessWidget {
  const CustomPaginationDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.whiteBorderColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: CustomPrimaryText(
        text: '...',
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
    );
  }
}
