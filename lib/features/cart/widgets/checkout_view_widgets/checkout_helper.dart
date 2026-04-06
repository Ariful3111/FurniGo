import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/controller/checkout_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CheckoutHelper {
  Widget paymentTile({
    required String title,
    required int value,
    required CheckoutController controller,
  }) {
    return Row(
      children: [
        CustomRadioButton(
          value: value,
          groupValue: controller.selectedMethod.value,
          onChange: (val) {
            controller.selectedMethod.value = val;
          },
        ),
        CustomPrimaryText(
          text: title,
          fontSize: 16.sp,
          color: AppColors.buttonTextColor,
        ),
      ],
    );
  }
}