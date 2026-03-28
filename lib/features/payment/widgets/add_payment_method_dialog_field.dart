import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AddPaymentMethodDialogField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String label;
  const AddPaymentMethodDialogField({
    super.key,
    required this.title,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.titleColor,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(controller: controller, labelText: label),
      ],
    );
  }
}
