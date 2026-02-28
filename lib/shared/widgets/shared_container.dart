import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class SharedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? radius;
  final BoxBorder? border;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  const SharedContainer({
    super.key,
    required this.child,
    this.padding,
    this.radius,
    this.border, this.color, this.boxShadow, this.margin,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
          margin: margin,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: isDark ?color?? AppColors.labelColor :color?? AppColors.whiteColor,
        borderRadius: BorderRadius.circular(radius ?? 24.r),
        border: border,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
