import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomDateField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? fillColor;
  final String? label;
  const CustomDateField({
    super.key,
    required this.controller,
    required this.onTap,
    this.textColor,
    this.fillColor,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return CustomTextFormField(
      controller: controller,
      labelTextWidget: CustomPrimaryText(
        text: label ?? 'Date',
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: isDark ? AppColors.primaryBorderColor : Color(0xFF42526D),
      ),
      hintText: 'Select Date',
      readOnly: true,
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: GestureDetector(
          onTap: onTap,
          child: Image.asset(
            IconsPath.date,
            height: 20.h,
            width: 20.w,
            color: isDark ? AppColors.whiteColor : null,
          ),
        ),
      ),
      textColor: textColor,
      fillColor: fillColor,
    );
  }
}
