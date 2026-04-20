import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_payment_dialog_method.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPaymentDialog extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? sub;
  final String? buttonText;
  final String? priceText;
  final Widget? price;
  final List<String> cardList;
  final RxString selectedCard;
  final void Function(String? value) onSelect;
  final double? height;
  final String? successTitle;
  final String? successSub;
  final Widget? successWidget;
  final double? successHeight;
  const CustomPaymentDialog({
    super.key,
    this.icon,
    this.title,
    this.sub,
    this.buttonText,
    required this.cardList,
    required this.selectedCard,
    required this.onSelect,
    this.height,
    this.priceText,
    this.price,
    this.successTitle,
    this.successSub,
    this.successWidget,
    this.successHeight,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.widthOf(context),
        height: height ?? 380.h,
        padding: EdgeInsets.all(25.r),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : Color(0xFFFAFBFC),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            rentalShadow(y: 4, blur: 6, spreadRadius: -4),
            rentalShadow(y: 10, blur: 15, spreadRadius: -3),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrimaryText(
                    text: title ?? 'Payment',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.whiteColor
                        : AppColors.darkTextColor,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      IconsPath.close,
                      height: 16.h,
                      width: 16.w,
                      color: isDark
                          ? AppColors.primaryBorderColor
                          : AppColors.darkTextColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 9.59.h),
              CustomPrimaryText(
                text: sub ?? 'Pay your installment.',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : Color(0xFF6B7280),
              ),
              SizedBox(height: 48.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrimaryText(
                    text: priceText ?? 'Amount',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: isDark
                        ? AppColors.whiteColor
                        : AppColors.darkTextColor,
                  ),
                  price ??
                      CustomPrimaryText(
                        text: '\$125.00',
                        fontWeight: FontWeight.w600,
                      ),
                ],
              ),
              SizedBox(height: 35.h),
              CustomPaymentDialogMethod(
                icon: icon,
                buttonText: buttonText,
                cardList: cardList,
                onSelect: onSelect,
                selectedCard: selectedCard,
                cardController: TextEditingController(),
                expiryDateController: TextEditingController(),
                cvvController: TextEditingController(),
                onTap: () {},
                title: successTitle,
                sub: successSub,
                widget: successWidget,
                height: successHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
