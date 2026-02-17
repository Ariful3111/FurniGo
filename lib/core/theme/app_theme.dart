import 'package:flutter/material.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      
    )
  );
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primaryColor: AppColors.darkColor,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkColor,
      surface: AppColors.darkColor,
    ),
    datePickerTheme: DatePickerThemeData()
  );
}