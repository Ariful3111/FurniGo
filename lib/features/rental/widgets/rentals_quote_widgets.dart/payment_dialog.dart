import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/payment_dialog_method.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.widthOf(context),
        height: 365.h,
        padding: EdgeInsets.all(13.58.r),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : Color(0xFFFAFBFC),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            rentalShadow(y: 4, blur: 6, spreadRadius: -4),
            rentalShadow(y: 10, blur: 15, spreadRadius: -3),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPrimaryText(
              text: 'Payment',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
            ),
            SizedBox(height: 9.59.h),
            CustomPrimaryText(
              text: 'Pay your installment.',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: isDark ? AppColors.primaryBorderColor : Color(0xFF6B7280),
            ),
            SizedBox(height: 48.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPrimaryText(
                  text: 'Amount',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.darkTextColor,
                ),
                CustomPrimaryText(
                  text: '\$125.00',
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 35.h),
            PaymentDialogMethod(),
          ],
        ),
      ),
    );
  }
}
