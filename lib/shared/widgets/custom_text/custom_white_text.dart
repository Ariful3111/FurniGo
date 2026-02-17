

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CustomWhiteText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  const CustomWhiteText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.textOverflow,
  });

  @override
  Widget build(BuildContext context) { 
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      style: GoogleFonts.montserrat( 
        fontSize: fontSize ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.bold,
        color:isDark?color??AppColors.darkColor :color?? AppColors.whiteColor,
      ),
    );
  }
}