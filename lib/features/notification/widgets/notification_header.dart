import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(IconsPath.back, height: 24.h, width: 24.w),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPrimaryText(text: 'Notifications'),
            SizedBox(height: 4.h),
            CustomSpanText(
              title: 'You have ',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              spanColor: isDark
                  ? AppColors.whiteColor
                  : AppColors.primaryGreyTextColor,
              inlineSpan: [
                TextSpan(
                  text: '3 Notifications',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    foreground: Paint()
                      ..shader = LinearGradient(
                        colors: [
                          Color(0xFF1348D2),
                          Color(0xFF1B6ADD),
                          Color(0xFF209DF0),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(Rect.fromLTWH(0, 0, 200, 100)),
                  ),
                ),
                TextSpan(
                  text: ' today',
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: isDark
                        ? AppColors.whiteColor
                        : AppColors.primaryGreyTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: 40.w),
        Expanded(
          child: CustomSecondaryButton(
            radius: 6.r,
            padding: EdgeInsets.all(8.r),
            border: Border.all(
              width: 1.r,
              color: isDark
                  ? AppColors.darkBorderColor
                  : AppColors.primaryBorderColor,
            ),
            text: 'Mark all as read',
            icon: IconsPath.mark,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
