import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomTableStatus extends StatelessWidget {
  final String status;

  const CustomTableStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (status) {
      case 'Pending':
        bgColor = AppColors.pendingBGColor;
        textColor = AppColors.pendingTextColor;
        break;
      case 'Quote Sent':
        bgColor = AppColors.quoteBGColor;
        textColor = AppColors.quoteTextColor;
        break;
      case 'Revise Quote':
        bgColor = AppColors.reviseBGColor;
        textColor = AppColors.reviseTextColor;
        break;
      case 'Active':
        bgColor = AppColors.activeBGColor;
        textColor = AppColors.activeTextColor;
        break;
      case 'Completed':
      case 'Competed':
        bgColor = AppColors.completeBgColor;
        textColor = AppColors.completeTextColor;
        break;
      case 'Rejected':
        bgColor = AppColors.rejectedBGColor;
        textColor = AppColors.rejectedTextColor;
        break;
      default:
        bgColor = AppColors.fieldColor;
        textColor = AppColors.fieldTextColor;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: CustomPrimaryText(
        text: status,
        fontSize: 12.sp,
        color: textColor,
      ),
    );
  }
}