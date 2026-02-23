import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.widthOf(context),
        height: 320.h,
        padding: EdgeInsets.all(16.44.r),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [rentalShadow(y: 6.58, blur: 23.01)],
        ),
        child: Column(
          children: [
            Image.asset(IconsPath.confirm,height: 180.h,width: 180.w,),
            CustomPrimaryText(
              text: 'Payment processed successfully!',
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.labelColor,
            ),
            SizedBox(height: 8.h),
            CustomPrimaryText(
              text: 'Receipt #INV-004 has been emailed to you',
              fontSize: 14.sp,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
