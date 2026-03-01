import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        row(
          isDark: isDark,
          sub1: 'Order Placed',
          sub2: 'Order ID',
          title1: 'Nov 10, 2023',
          title2: '#ORD-7784',
        ),
      ],
    );
  }

  Widget row({
    required bool isDark,
    required String sub1,
    required String sub2,
    required String title1,
    required String title2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPrimaryText(
              text: sub1,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: isDark
                  ? AppColors.darkPrimaryTextColor
                  : AppColors.greyColor,
            ),
            SizedBox(height: 4.h),
            CustomPrimaryText(
              text: title1,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.titleColor,
            ),
          ],
        ),
        SizedBox(width: 20.w),
        Container(
          height: 40.h,
          width: 1.w,
          decoration: BoxDecoration(
            color:isDark?Color(0xFF697483): AppColors.fieldBorderColorLight,
            border: Border.all(width: 1.r,color: isDark?Color(0xFF697483):AppColors.fieldBorderColorLight),
          ),
        ),
        SizedBox(width: 40.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPrimaryText(
              text: sub2,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: isDark
                  ? AppColors.darkPrimaryTextColor
                  : AppColors.greyColor,
            ),
            SizedBox(height: 4.h),
            CustomPrimaryText(
              text: title2,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.titleColor,
            ),
          ],
        ),
      ],
    );
  }
}
