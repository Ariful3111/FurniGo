import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';

class AuthCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged onChange;
  const AuthCheckBox({
    super.key,
    required this.isChecked,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        CustomCheckBox(isChecked: isChecked, onChange: onChange),
        RichText(
          text: TextSpan(
            text: ' I agree to the ',
            style: GoogleFonts.montserrat(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color:isDark?AppColors.whiteColor: AppColors.darkColor,
            ),
            children: [
              TextSpan(
                text: 'Terms',
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF2DADE2),
                ),
              ),
              TextSpan(
                text: ' & ',
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color:isDark?AppColors.whiteColor: AppColors.darkColor,
                ),
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF2DADE2),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
