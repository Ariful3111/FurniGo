import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

Widget authField({
    required String text,
    required String labelText,
    required TextEditingController controller,
    required String icon,
    String? Function(String?)? validator,
    AutovalidateMode? validation,
   required BuildContext context,
  }) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: text,
          fontSize: 16.sp,
          color:isDark?AppColors.primaryBorderColor: AppColors.buttonTextColor,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller,
          labelText: labelText,
          borderColor:isDark? AppColors.darkBorderColor:AppColors.fieldBorderColor,
          fillColor:isDark? AppColors.labelColor:AppColors.fieldColor,
          borderRadius: 12.r,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Image.asset(icon, height: 20.h, width: 20.w),
          ),
          validation: validation,
          validator: validator,
        ),
      ],
    );
  }