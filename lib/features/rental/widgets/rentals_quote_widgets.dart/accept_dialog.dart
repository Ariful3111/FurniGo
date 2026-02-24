import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/payment_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AcceptDialog extends StatelessWidget {
  const AcceptDialog({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.widthOf(context),
        height: 261.h,
        padding: EdgeInsets.all(13.58.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.3.r),
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
          boxShadow: [rentalShadow(y: 5.43, blur: 19.02)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(IconsPath.moneyBag, height: 101.89.h, width: 101.89.w),
            SizedBox(height: 21.h),
            CustomPrimaryText(
              text: 'Thank you for accepting.',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.labelColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            CustomPrimaryText(
              text: 'Kindly proceed to pay for confirmation.',
              fontSize: 12.sp,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyTextColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomPrimaryButton(
                    boxShadow: buttonShadow,
                    text: 'Proceed to pay',
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PaymentDialog();
                        },
                      );
                    },
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomPrimaryButton(
                    boxShadow: buttonShadow,
                    text: 'Pay Later',
                    backgroundColor: AppColors.whiteColor,
                    border: Border.all(
                      width: 0.68.r,
                      color: isDark
                          ? AppColors.darkBorderColor
                          : AppColors.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    fontSize: 12.sp,
                    textColor: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
