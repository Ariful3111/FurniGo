import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomTableStatus extends StatelessWidget {
  final String status;

  const CustomTableStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    Color bgColor;
    Color textColor;

    switch (status) {
      case 'Pending':
        bgColor =isDark? AppColors.darkPendingBGColor:AppColors.pendingBGColor;
        textColor =isDark? AppColors.darkPendingTextColor:AppColors.pendingTextColor;
        break;
      case 'Quote Sent':
        bgColor =isDark? AppColors.darkQuoteBGColor:AppColors.quoteBGColor;
        textColor =isDark?AppColors.darkQuoteTextColor: AppColors.quoteTextColor;
        break;
      case 'Revise Quote':
        bgColor =isDark? AppColors.darkReviseBGColor:AppColors.reviseBGColor;
        textColor =isDark? AppColors.darkReviseTextColor:AppColors.reviseTextColor;
        break;
      case 'Active':
        bgColor =isDark?AppColors.darkActiveBGColor: AppColors.activeBGColor;
        textColor =isDark?AppColors.darkActiveTextColor: AppColors.activeTextColor;
        break;
      case 'Completed':
      case 'Competed':
        bgColor =isDark?AppColors.darkCompleteBgColor: AppColors.completeBgColor;
        textColor =isDark?AppColors.darkCompleteTextColor :AppColors.completeTextColor;
        break;
      case 'Rejected':
        bgColor =isDark? AppColors.darkRejectedBGColor:AppColors.rejectedBGColor;
        textColor =isDark?AppColors.darkRejectedTextColor: AppColors.rejectedTextColor;
        break;
      default:
        bgColor = AppColors.fieldColor;
        textColor = AppColors.fieldTextColor;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: CustomPrimaryText(
        text: status,
        fontSize: 12.sp,
        color: textColor,
      ),
    );
  }
}