import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';

class OtherField extends StatelessWidget {
  final TextEditingController controller;
  final bool? readOnly;
  final double? height;
  final double? width;
  final String? labelText;
  final TextInputType? keyboardType;
  const OtherField({
    super.key,
    required this.controller,
    this.readOnly,
    this.height,
    this.width,
    this.labelText,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: height ?? 36.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? AppColors.darkColor
                : Color(0xFFE4E5E7).withValues(alpha: 0.24),
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: CustomTextFormField(
        controller: controller,
        borderColor:isDark?AppColors.darkBorderColor: Color(0xFFE2E4E9),
        labelText: labelText ?? 'Other',
        labelColor: isDark
            ? AppColors.primaryBorderColor
            : AppColors.primaryGreyTextColor,
        labelFontSize: 12.sp,
        padding: EdgeInsets.all(4.r),
        fillColor: isDark ? AppColors.labelColor : AppColors.whiteColor,
        readOnly: readOnly,
        keyboardType: keyboardType,
      ),
    );
  }
}
