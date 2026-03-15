import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? hintTextWidget;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Color? textColor;
  final Color? cursorColor;
  final Color? labelColor;
  final double? fontSize;
  final double? labelFontSize;
  final FontWeight? fontWeight;
  final TextEditingController controller;
  final TextDirection? textDirection;
  final double? width;
  final Widget? labelTextWidget;
  final String? labelText;
  final String? errorText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool? readOnly;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AutovalidateMode? validation;
  final bool? isFilled;
  final BorderSide? border;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Color? fillColor;
  final int? maxLength;
  final int? maxLines;
  final TextDirection? hintDirection;
  final bool? isAlignLabelWithHint;
  final double? fontHeight;
  final double? cursorHeight;
  final bool? isDense;
  final FocusNode? focusNode;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final FontWeight? labelFontWeight;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
    this.keyboardType,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    required this.controller,
    this.textDirection,
    this.width,
    this.labelText,
    this.errorText,
    this.validator,
    this.onChanged,
    this.readOnly,
    this.hintTextWidget,
    this.labelTextWidget,
    this.padding,
    this.margin,
    this.validation,
    this.isFilled,
    this.border,
    this.floatingLabelBehavior,
    this.fillColor,
    this.maxLength,
    this.maxLines,
    this.hintDirection,
    this.isAlignLabelWithHint,
    this.fontHeight,
    this.cursorHeight,
    this.isDense,
    this.focusNode,
    this.borderRadius,
    this.borderWidth,
    this.labelColor,
    this.borderColor,
    this.labelFontSize,
    this.labelFontWeight, this.cursorColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: controller,
      maxLines: obscureText == true ? 1 : maxLines,
      maxLength: maxLength,
      textDirection: textDirection ?? TextDirection.ltr,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      autovalidateMode: validation,
      cursorHeight: cursorHeight,
      focusNode: focusNode,
      style: GoogleFonts.montserrat(
        color: isDark
            ? textColor ?? AppColors.whiteColor
            : textColor ?? AppColors.darkColor,
        fontSize: fontSize ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        height: fontHeight,
      ),
      cursorColor: isDark ?cursorColor?? AppColors.whiteColor : cursorColor?? AppColors.darkColor,
      decoration: InputDecoration(
        floatingLabelBehavior: floatingLabelBehavior,
        hintTextDirection: hintDirection,
        alignLabelWithHint: isAlignLabelWithHint,
        contentPadding: padding,
        isDense: isDense,
        label:
            labelTextWidget ??
            CustomPrimaryText(
              text: labelText ?? "",
              color: isDark
                  ? labelColor ?? AppColors.primaryBorderColor
                  : labelColor ?? AppColors.fieldTextColor,
              fontSize: labelFontSize ?? 16.sp,
              fontWeight: labelFontWeight,
            ),
        hint:
            hintTextWidget ??
            CustomPrimaryText(
              text: hintText ?? "",
              color: AppColors.fieldTextColor,
              fontSize: 16.sp,
            ),
        errorText: errorText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          borderSide:
              border ??
              BorderSide(
                width: borderWidth ?? 1.r,
                color: isDark
                    ? borderColor ?? AppColors.darkBorderColor
                    : borderColor ?? AppColors.fieldBorderColorLight,
              ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          borderSide:
              border ??
              BorderSide(
                width: borderWidth ?? 1.r,
                color: isDark
                    ? borderColor ?? AppColors.darkBorderColor
                    : borderColor ?? AppColors.fieldBorderColorLight,
              ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          borderSide:
              border ??
              BorderSide(
                width: borderWidth ?? 1.r,
                color: isDark
                    ? borderColor ?? AppColors.darkBorderColor
                    : borderColor ?? AppColors.fieldBorderColorLight,
              ),
        ),
        filled: isFilled ?? true,
        fillColor: isDark
            ? fillColor ?? AppColors.labelColor
            : fillColor ?? AppColors.whiteColor,
      ),
    );
  }
}
