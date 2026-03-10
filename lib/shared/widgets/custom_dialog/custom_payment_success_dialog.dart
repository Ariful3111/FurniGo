import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPaymentSuccessDialog extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? sub;
  final Widget? widget;
  final double? height;
  const CustomPaymentSuccessDialog({
    super.key,
    this.icon,
    this.title,
    this.sub,
    this.widget,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.widthOf(context),
        height: height ?? 320.h,
        padding: EdgeInsets.all(16.44.r),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [rentalShadow(y: 6.58, blur: 23.01)],
        ),
        child: Column(
          children: [
            Image.asset(icon ?? IconsPath.confirm, height: 180.h, width: 180.w),
            CustomPrimaryText(
              text: title ?? 'Payment processed successfully!',
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.labelColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            CustomPrimaryText(
              text: sub ?? 'Receipt #INV-004 has been emailed to you',
              fontSize: 14.sp,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyTextColor,
              textAlign: TextAlign.center,
            ),
            ?widget,
          ],
        ),
      ),
    );
  }
}
