import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomTableActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? text;
  final String? icon;
  final double? height;
  final double? width;
  final double? iconHeight;
  final double? iconWidth;
  final double? fontSize;
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
  const CustomTableActionButton({
    super.key,
    required this.onTap,
    this.icon,
    this.text,
    this.height,
    this.width,
    this.iconHeight,
    this.iconWidth,
    this.fontSize,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
    this.radius,
    this.boxDecoration,
    this.child,
    this.fontWeight,
    this.padding,
    this.border,
    this.boxShadow,
  });
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            padding ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.whiteColor,
          border:
              border ??
              Border.all(
                color: isDark
                    ? AppColors.darkBorderColor
                    : AppColors.buttonBorderColor,
                width: 1.r,
              ),
          borderRadius: BorderRadius.circular(radius ?? 50.r),
          boxShadow: boxShadow,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomPrimaryText(
                text: text ?? 'View Detail',
                fontSize: fontSize ?? 12.sp,
                fontWeight: fontWeight,
                color: isDark
                    ? textColor ?? AppColors.darkColor
                    : textColor ?? AppColors.labelColor,
              ),
              SizedBox(width: 4.w),
              Image.asset(
                icon ?? IconsPath.arrowRight,
                height: iconHeight ?? 16.h,
                width: iconWidth ?? 16.w,
                color: isDark
                    ? iconColor ?? AppColors.darkColor
                    : iconColor ?? AppColors.labelColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
