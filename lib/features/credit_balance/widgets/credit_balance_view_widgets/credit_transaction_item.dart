import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_transaction_model.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CreditTransactionItem extends StatelessWidget {
  final CreditTransaction transaction;
  const CreditTransactionItem({super.key, required this.transaction});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isPositive = (transaction.amount ?? 0) > 0;
    return SharedContainer(
      margin: EdgeInsets.only(bottom: 4.h),
      padding: EdgeInsets.all(10.r),
      radius: 10.r,
      color: isDark ? AppColors.darkColor : AppColors.primaryBorderColor,
      border: Border.all(
        color: isDark ? AppColors.darkColor : AppColors.borderColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: transaction.title ?? '',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
              SizedBox(height: 2.h),
              CustomPrimaryText(
                text: transaction.date ?? '',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.darkPrimaryTextColor
                    : AppColors.greyTextColor,
              ),
            ],
          ),
          SharedContainer(
            padding: EdgeInsets.symmetric(horizontal: 6.26.w, vertical: 5.22.h),
            color: isDark ? AppColors.labelColor : AppColors.whiteColor,
            radius: 20.r,
            child: CustomPrimaryText(
              text: _amountText(isPositive),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.whiteColor : AppColors.labelColor,
            ),
          ),
        ],
      ),
    );
  }

  String _amountText(bool isPositive) {
    final double amount = transaction.amount ?? 0;
    final int intValue = amount.toInt();
    final bool isWholeNumber = amount == intValue;
    final String value = isWholeNumber
        ? intValue.toString()
        : amount.toStringAsFixed(2);
    return isPositive ? '+$value' : value;
  }
}
