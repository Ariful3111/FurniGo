import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CustomDivider extends StatelessWidget {
  final Color? color;
  const CustomDivider({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Divider(
      color: isDark
          ? color ?? AppColors.darkBorderColor
          : color ?? AppColors.borderColor,
      thickness: 1.h,
    );
  }
}
