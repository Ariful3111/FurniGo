

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CustomPrimaryText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final List<Shadow> ?shadow;
  final TextDecoration? decoration;
  final int ? maxLine;
  const CustomPrimaryText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight, 
    this.color,
    this.textAlign,
    this.textOverflow, this.shadow, this.decoration, this.maxLine,
  });

  @override
  Widget build(BuildContext context) { 
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLine,
      style: GoogleFonts.montserrat(
        fontSize: fontSize ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        color:isDark?color?? AppColors.whiteColor:color?? AppColors.primaryColor,
        shadows: shadow,
        decoration: decoration,
      ),
    );
  }
}