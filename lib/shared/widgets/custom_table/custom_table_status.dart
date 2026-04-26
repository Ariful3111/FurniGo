import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomTableStatus extends StatelessWidget {
  final String status;
  final double? width;
  const CustomTableStatus({super.key, required this.status, this.width});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color bgColor;
    Color textColor;
    switch (status) {
      case 'Pending':
      case 'Processing':
      case 'In Review':
        bgColor = isDark
            ? AppColors.darkPendingBGColor
            : AppColors.pendingBGColor;
        textColor = isDark
            ? AppColors.darkPendingTextColor
            : AppColors.pendingTextColor;
        break;
      case 'Quote Sent':
        bgColor = isDark ? AppColors.darkQuoteBGColor : AppColors.quoteBGColor;
        textColor = isDark
            ? AppColors.darkQuoteTextColor
            : AppColors.quoteTextColor;
        break;
      case 'Revise Quote':
        bgColor = isDark
            ? AppColors.darkReviseBGColor
            : AppColors.reviseBGColor;
        textColor = isDark
            ? AppColors.darkReviseTextColor
            : AppColors.reviseTextColor;
        break;
      case 'Active':
      case 'Out for delivery':
      case 'Offer Ready':
      case 'Offer Accepted':
      case 'Received':
      case 'Delivered':
      case 'Accepted':
      case 'Success':
      case 'Open':
      case 'Completed':
      case 'Competed':
      case 'Default':
        bgColor = isDark
            ? AppColors.darkActiveBGColor
            : AppColors.activeBGColor;
        textColor = isDark
            ? AppColors.darkActiveTextColor
            : AppColors.activeTextColor;
        break;
      case 'Rejected':
      case '2nd installment: Due':
        bgColor = isDark
            ? AppColors.darkRejectedBGColor
            : AppColors.rejectedBGColor;
        textColor = isDark
            ? AppColors.darkRejectedTextColor
            : AppColors.rejectedTextColor;
        break;
      case '2nd installment: Upcoming':
        bgColor =  Color(0xFFFFE7D3);
        textColor =  Color(0xFFFF8D28);
        break;
      case 'Resolved':
        bgColor = isDark
            ? AppColors.darkCompleteBgColor
            : AppColors.completeBgColor;
        textColor = isDark
            ? AppColors.primaryBorderColor
            : AppColors.whiteColor;
        break;
      default:
        bgColor = AppColors.fieldColor;
        textColor = AppColors.fieldTextColor;
    }

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: CustomPrimaryText(
        text: status,
        fontSize: 12.sp,
        color: textColor,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
