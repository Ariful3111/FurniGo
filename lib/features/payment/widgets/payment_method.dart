import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/payment/widgets/add_payment_method_dialog.dart';
import 'package:zb_dezign/features/payment/widgets/payment_header.dart';
import 'package:zb_dezign/features/payment/widgets/payment_method_item.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({super.key});

  final List<Map<String, dynamic>> cards = [
    {
      "type": "Visa",
      "icon": IconsPath.visa,
      "number": "•••• 4242",
      "expiry": "12/25",
      "isDefault": true,
    },
    {
      "type": "Mastercard",
      "icon": IconsPath.masterCard,
      "number": "•••• 4242",
      "expiry": "12/25",
      "isDefault": false,
    },
    {
      "type": "Mastercard",
      "icon": IconsPath.masterCard,
      "number": "•••• 4242",
      "expiry": "12/25",
      "isDefault": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(16.w),
      radius: 24.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentHeader(
            icon1: IconsPath.drawerPayment,
            title: 'Payment methods',
            sub: 'Manage cards and EFT details',
            icon2: IconsPath.add,
            buttonText: 'Add',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AddPaymentMethodDialog();
                },
              );
            },
          ),
          SizedBox(height: 24.h),
          CustomDivider(),
          SizedBox(height: 24.h),
          CustomPrimaryText(
            text: "Cards",
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.titleColor,
          ),
          SizedBox(height: 16.h),
          Column(
            children: List.generate(cards.length, (index) {
              final card = cards[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: PaymentMethodItem(card: card),
              );
            }),
          ),
        ],
      ),
    );
  }
}
