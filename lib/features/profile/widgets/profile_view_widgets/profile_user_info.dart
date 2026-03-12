import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPrimaryText(
              text: 'Sadman Sakib',
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.darkColor,
            ),
            SizedBox(width: 4.w),
            Image.asset(IconsPath.blueStar, height: 20.h, width: 20.w),
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPrimaryText(
              text: 'sakib@gmail.com',
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyTextColor,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              height: 13.h,
              width: 1.w,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyTextColor,
            ),
            CustomPrimaryText(
              text: 'Personal',
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyTextColor,
            ),
          ],
        ),
        SizedBox(height: 4.h),
        CustomSpanText(
          title: 'Credit Balance: ',
          spantext: '1250',
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: isDark
              ? AppColors.darkPrimaryTextColor
              : AppColors.secondaryColor,
          spanColor: isDark
              ? AppColors.darkPrimaryTextColor
              : AppColors.secondaryColor,
          spanFontSize: 16.sp,
          spanFontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
