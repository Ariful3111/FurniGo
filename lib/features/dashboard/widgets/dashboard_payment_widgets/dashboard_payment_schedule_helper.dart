import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
const Color _kGreenDot = Color(0xFF34C759);
const Color _kBlueDot = Color(0xFF007AFF);
const Color _kGrayDot = Color(0xFFD1D1D6);
const Color _kGreenText = Color(0xFF34C759);
const Color _kMutedText = Color(0xFF6A6A6A);
const Color _kStrike = Color(0xFFAAAAAA);
enum PaymentState { paid, current, future }

class PaymentItem {
  final String date;
  final String amount;
  final PaymentState state;
  const PaymentItem({
    required this.date,
    required this.amount,
    required this.state,
  });
}

class DashboardPaymentScheduleHelper {
   static const List<PaymentItem> items = [
    PaymentItem(date: 'Oct 15', amount: '\$125.00', state: PaymentState.paid),
    PaymentItem(
      date: 'Nov 15',
      amount: '\$125.00',
      state: PaymentState.current,
    ),
    PaymentItem(
      date: 'Dec 15',
      amount: '\$125.00',
      state: PaymentState.future,
    ),
  ];

  Color dotColor(PaymentState s) {
    switch (s) {
      case PaymentState.paid:
        return _kGreenDot;
      case PaymentState.current:
        return _kBlueDot;
      case PaymentState.future:
        return _kGrayDot;
    }
  }

  Widget rowContent(PaymentItem item, bool isDark) {
    final bool isPaid = item.state == PaymentState.paid;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPrimaryText(
          text: item.date,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: isPaid
              ? _kStrike
              : (isDark ? AppColors.darkPrimaryTextColor : _kMutedText),
          decoration: isPaid ? TextDecoration.lineThrough : null,
        ),
        isPaid
            ? CustomPrimaryText(
                text: 'Paid',
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: _kGreenText,
              )
            : CustomPrimaryText(
                text: item.amount,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isDark ? AppColors.darkPrimaryTextColor : _kMutedText,
              ),
      ],
    );
  }


}