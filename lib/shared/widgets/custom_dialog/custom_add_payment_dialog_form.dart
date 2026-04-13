import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomAddPaymentDialogForm extends StatelessWidget {
  final TextEditingController cardController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;
  const CustomAddPaymentDialogForm({
    super.key,
    required this.cardController,
    required this.expiryDateController,
    required this.cvvController,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        field(
          text: 'Card Number',
          controller: cardController,
          isDark: isDark,
          label: 'Enter Your Card Number',
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
              child: field(
                text: 'Expiry Date',
                controller: expiryDateController,
                isDark: isDark,
                label: 'Expiry Date',
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: field(
                text: 'CVV',
                controller: cvvController,
                isDark: isDark,
                label: 'CVV',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget field({
    required String text,
    required TextEditingController controller,
    required bool isDark,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: text,
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          controller: controller,
          labelText: label,
          borderWidth: 1.2.r,
        ),
      ],
    );
  }
}
