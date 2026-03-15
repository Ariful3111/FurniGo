import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_calculation_amount.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentalQuotesCalculation extends StatelessWidget {
  const RentalQuotesCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
      border: Border.all(color: Color(0xFFB9F8CF), width: 1.2.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Quote ready',
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xFF0D542B),
          ),
          SizedBox(height: 24.h),
          cal(title: 'Subtotal', amount: '\$12280.0', context: context),
          SizedBox(height: 12.h),
          cal(title: 'Discount (3%)', amount: '-\$130.00', context: context),
          SizedBox(height: 12.h),
          cal(title: 'Setup Charge', amount: '\$122.0', context: context),
          SizedBox(height: 16.h),
          CustomDivider(color: AppColors.buttonBorderColor),
          SizedBox(height: 6.h),
          cal(
            title: 'Total',
            amount: '\$1245.00',
            context: context,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 20.h),
          RentalQuotesCalculationAmount(),
        ],
      ),
    );
  }

  Widget cal({
    required String title,
    required String amount,
    required BuildContext context,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight,
          color: isDark
              ? AppColors.darkPrimaryTextColor
              : AppColors.buttonTextColor,
        ),
        CustomPrimaryText(
          text: amount,
          fontSize: fontSize ?? 16.sp,
          fontWeight: fontWeight,
          color: isDark
              ? AppColors.darkPrimaryTextColor
              : AppColors.buttonTextColor,
        ),
      ],
    );
  }
}
