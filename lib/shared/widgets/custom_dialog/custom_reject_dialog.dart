import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomRejectDialog extends StatelessWidget {
  const CustomRejectDialog({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      alignment: Alignment.center,
      child: Container(
        height: 375.h,
        width: MediaQuery.widthOf(context),
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: [rentalShadow(y: 8, blur: 28)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(IconsPath.rejectEmoji, height: 120.h, width: 120.w),
            SizedBox(height: 24.h),
            CustomPrimaryText(
              text: 'Quotation rejected',
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
            ),
            SizedBox(height: 12.h),
            CustomPrimaryText(
              text:
                  'We appreciate your effort, please visit again or submit another proposal anytime.',
              fontSize: 14.sp,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyTextColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            CustomPrimaryButton(
              text: 'Back',
              height: 40.h,
              fontSize: 14.sp,
              boxShadow: buttonShadow,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
