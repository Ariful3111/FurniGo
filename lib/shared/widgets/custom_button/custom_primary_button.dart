import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String text;
  final double? fontSize;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;
  final BoxDecoration? boxDecoration;
  final Widget? child;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  const CustomPrimaryButton({
    super.key,
    this.height,
    this.width,
    required this.text,
    this.fontSize,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.child,
    this.boxDecoration,
    this.fontWeight,
    this.padding,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        height: height,
        width: width,
        decoration:
            boxDecoration ??
            BoxDecoration(
              color: isDark
                  ? backgroundColor ?? AppColors.whiteColor
                  : backgroundColor ?? AppColors.secondaryColor,
              borderRadius: borderRadius ?? BorderRadius.circular(100.r),
              border: border,
              boxShadow: boxShadow,
            ),
        child:
            child ??
            Center(
              child: CustomPrimaryText(
                text: text,
                color: isDark
                    ? textColor ?? AppColors.darkColor
                    : textColor ?? AppColors.whiteColor,
                fontSize: fontSize ?? 14.sp,
                fontWeight: fontWeight,
                textAlign: TextAlign.center,
              ),
            ),
      ),
    );
  }
}
