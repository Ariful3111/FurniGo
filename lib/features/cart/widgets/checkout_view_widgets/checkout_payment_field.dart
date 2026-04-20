import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/controller/checkout_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';

class CheckoutPaymentField extends GetWidget<CheckoutController> {
  const CheckoutPaymentField({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      child: Column(
        children: [
          CustomTextFormField(
            controller: controller.cardNumber,
            labelText: "Card Number",
            borderColor: isDark
                ? AppColors.primaryBorderColor
                : AppColors.grayBorderColor,
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            controller: controller.mmYY,
            labelText: "MM/YY",
            borderColor: isDark
                ? AppColors.primaryBorderColor
                : AppColors.grayBorderColor,
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            controller: controller.cvv,
            labelText: "CVV",
            borderColor: isDark
                ? AppColors.primaryBorderColor
                : AppColors.grayBorderColor,
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            controller: controller.nameOnCard,
            labelText: "Name on Card",
            borderColor: isDark
                ? AppColors.primaryBorderColor
                : AppColors.grayBorderColor,
          ),
        ],
      ),
    );
  }
}
