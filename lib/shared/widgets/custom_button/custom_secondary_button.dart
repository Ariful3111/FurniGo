import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomSecondaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? iconHeight;
  final double? iconWidth;
  final String text;
  final String icon;
  final double? fontSize;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final double? radius;
  final BoxDecoration? boxDecoration;
  final Widget? child;
  final FontWeight? fontWeight;
  final EdgeInsets? padding;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  const CustomSecondaryButton({
    super.key,
    this.height,
    this.width,
    this.iconHeight,
    this.iconWidth,
    required this.text,
    required this.icon,
    this.fontSize,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.radius,
    this.boxDecoration,
    this.child,
    this.fontWeight,
    this.padding,
    this.border,
    this.boxShadow, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding??EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
        height: height ?? 40.h,
        width: width,
        decoration:
            boxDecoration ??
            BoxDecoration(
              color: backgroundColor ?? AppColors.whiteColor,
              border:
                  border ??
                  Border.all(width: 1.r, color: AppColors.buttonBorderColor),
              borderRadius: BorderRadius.circular(radius ?? 100.r),
              boxShadow: boxShadow,
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              height: iconHeight ?? 16.h,
              width: iconWidth ?? 16.w,
              color: isDark?AppColors.whiteColor:iconColor,
            ),
            SizedBox(width: 4.w),
            CustomPrimaryText(
              text: text,
              fontSize: fontSize ?? 12.sp,
              color: textColor ?? AppColors.labelColor,
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
