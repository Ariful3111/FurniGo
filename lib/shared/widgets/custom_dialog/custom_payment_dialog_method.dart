import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_payment_success_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/custom_payment_dropdown/custom_payment_dropdown.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPaymentDialogMethod extends StatelessWidget {
  final String? icon;
  final String? buttonText;
  final List<String> cardList;
  final RxString selectedCard;
  final void Function(String?) onSelect;
  const CustomPaymentDialogMethod({super.key, this.icon, this.buttonText, required this.cardList, required this.selectedCard, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomPrimaryText(
              text: 'Payment Method',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
            ),
            CustomSecondaryButton(
              height: 28.h,
              width: 120.w,
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
              radius: 8.r,
              text: 'Add Method',
              icon: IconsPath.add,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 8.h),
        CustomPaymentDropdownMenu(
          cardList: cardList,
          selectedCard: selectedCard,
          onSelect: onSelect,
        ),
        SizedBox(height: 25.h),
        CustomPrimaryButton(
          text: buttonText ?? 'Pay Early',
          onPressed: () {
            Navigator.pop(context);
            showDialog(
              barrierColor: isDark
                  ? AppColors.whiteColor.withValues(alpha: 0.3)
                  : null,
              context: context,
              builder: (context) {
                return CustomPaymentSuccessDialog(icon: icon);
              },
            );
          },
        ),
      ],
    );
  }
}
