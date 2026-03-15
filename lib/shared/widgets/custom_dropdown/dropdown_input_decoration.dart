import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class DropdownInputDecoration {
  InputDecorationTheme inputDecoration({
    required BuildContext context,
    required Color? fillColor,
    required InputBorder? enableBorder,
    required InputBorder? focusBorder,
    required double? focusBorderWidth,
    required double? borderWidth,
    required double? borderRadius,
    required double? focusBorderRadius,
    required EdgeInsets? contentPadding,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return InputDecorationTheme(
      filled: true,
      fillColor: isDark
          ? fillColor ?? AppColors.labelColor
          : fillColor ?? AppColors.whiteColor,
      contentPadding: contentPadding,
      focusColor: Colors.transparent,
      enabledBorder:
          enableBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
            borderSide: BorderSide(
              width: borderWidth ?? 1.2.r,
              color: isDark
                  ? AppColors.darkBorderColor
                  : AppColors.fieldBorderColorLight,
            ),
          ),
      focusedBorder:
          focusBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(focusBorderRadius ?? 16.r),
            borderSide: BorderSide(
              width: focusBorderWidth ?? 1.2.r,
              color: isDark
                  ? AppColors.darkBorderColor
                  : AppColors.fieldBorderColorLight,
            ),
          ),
    );
  }
}
