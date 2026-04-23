import 'package:flutter/material.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged onChange;
  final Color? color;
  final Color? borderColor;
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChange,
    this.color,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Checkbox(
      side: BorderSide(
        color: isDark
            ? borderColor ?? AppColors.primaryBorderColor
            : borderColor ?? AppColors.darkColor,
      ),
      visualDensity: VisualDensity.compact,
      activeColor: isDark
          ? color ?? AppColors.boxColor
          : color ?? AppColors.primaryColor,
      value: isChecked,
      onChanged: onChange,
    );
  }
}
