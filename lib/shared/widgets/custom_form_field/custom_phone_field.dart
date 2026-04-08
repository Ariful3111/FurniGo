import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final Function(PhoneNumber)? onChanged;
  final FormFieldSetter<PhoneNumber>? onSaved;
  final String initialCountryCode;
  final Color? fillColor;
  final bool? isFilled;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final AutovalidateMode? validation;
  final String? Function(PhoneNumber?)? validator;
  const CustomPhoneField({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.initialCountryCode = 'BD',
    this.fillColor,
    this.isFilled,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.validation,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return IntlPhoneField(
      autovalidateMode: validation,
      validator: validator,
      controller: controller,
      initialCountryCode: initialCountryCode,
      showCountryFlag: false,
      dropdownIconPosition: IconPosition.trailing,
      dropdownIcon: Icon(
        Icons.keyboard_arrow_down,
        color: isDark ? AppColors.whiteColor : AppColors.fieldTextColor,
        size: 24.sp,
      ),
      style: GoogleFonts.montserrat(
        color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      dropdownTextStyle: GoogleFonts.montserrat(
        color: isDark ? AppColors.whiteColor : AppColors.buttonTextColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        isDense: true,
        label: CustomPrimaryText(
          text: labelText,
          color: isDark
              ? AppColors.primaryBorderColor
              : AppColors.fieldTextColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        hint: hintText != null
            ? CustomPrimaryText(
                text: hintText!,
                color: AppColors.fieldTextColor,
                fontSize: 16.sp,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          borderSide: BorderSide(
            width: borderWidth ?? 1.r,
            color: isDark
                ? borderColor ?? AppColors.primaryBorderColor
                : borderColor ?? AppColors.fieldBorderColorLight,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          borderSide: BorderSide(
            width: borderWidth ?? 1.r,
            color: isDark
                ? borderColor ?? AppColors.primaryBorderColor
                : borderColor ?? AppColors.fieldBorderColorLight,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          borderSide: BorderSide(
            width: borderWidth ?? 1.r,
            color: isDark
                ? borderColor ?? AppColors.primaryBorderColor
                : borderColor ?? AppColors.fieldBorderColorLight,
          ),
        ),
        filled: isFilled ?? true,
        fillColor: isDark
            ? fillColor ?? AppColors.labelColor
            : fillColor ?? AppColors.whiteColor,
        counterText: '',
      ),
      languageCode: "en",
      onChanged: onChanged,
      onSaved: onSaved,
      disableLengthCheck: false,
      cursorColor: isDark ? AppColors.whiteColor : AppColors.darkColor,
    );
  }
}
