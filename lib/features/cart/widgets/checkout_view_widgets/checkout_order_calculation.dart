import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/controller/checkout_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CheckoutOrderCalculation extends GetWidget<CheckoutController> {
  const CheckoutOrderCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    List total = [
      {'title': 'Subtotal', 'value': '\$280'},
      {'title': 'Shipping', 'value': '\$5'},
      {'title': 'Discount', 'value': '\$0'},
      {'title': 'Total', 'value': '\$250'},
    ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: controller.promoController,
                labelText: 'Promo Code',
                borderColor: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.grayBorderColor,
                borderRadius: 12.r,
              ),
            ),
            SizedBox(width: 8.w),
            CustomPrimaryButton(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              borderRadius: BorderRadius.circular(12.r),
              backgroundColor: isDark
                  ? AppColors.whiteColor
                  : AppColors.darkSecondaryColor,
              text: 'Apply',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 24.h),
        ...List.generate(total.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == total.length - 1 ? 0 : 20.h,
            ),
            child: _priceRow(
              isTotal: total[index]['title'] == 'Total',
              title: total[index]['title'],
              value: total[index]['value'],
              isDark: isDark,
            ),
          );
        }),
      ],
    );
  }

  Widget _priceRow({
    required String title,
    required String value,
    bool isTotal = false,
    required bool isDark,
  }) {
    return Row(
      children: [
        Expanded(
          child: CustomPrimaryText(
            text: title,
            fontSize: isTotal ? 20.sp : 18.sp,
            color: isDark
                ? AppColors.primaryBorderColor
                : (isTotal
                      ? AppColors.darkSecondaryColor
                      : AppColors.buttonTextColor),
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        CustomPrimaryText(
          text: value,
          fontSize: isTotal ? 20.sp : 18.sp,
          color: isDark
              ? AppColors.primaryBorderColor
              : AppColors.darkGreyColor,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
