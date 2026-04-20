// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged onChange;
  const CustomRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChange,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: isDark ? AppColors.boxColor : AppColors.primaryColor,
    );
  }
}
