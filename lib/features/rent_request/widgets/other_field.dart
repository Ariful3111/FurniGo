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
  const OtherField({
    super.key,
    required this.controller,
    this.readOnly,
    this.height,
    this.width, this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 36.h,
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xFFE4E5E7).withValues(alpha: 0.24),
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: CustomTextFormField(
        controller: controller,
        borderColor: Color(0xFFE2E4E9),
        labelText:labelText?? 'Other',
        labelColor: Color(0xFF42526D),
        labelFontSize: 12.sp,
        padding: EdgeInsets.zero,
        fillColor: AppColors.whiteColor,
        readOnly: readOnly,
      ),
    );
  }
}
