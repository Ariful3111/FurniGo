import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_payment_success_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_reject_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SellOfferReady extends StatelessWidget {
  final String amount;
  final VoidCallback onPayment;
  const SellOfferReady({super.key, required this.amount, required this.onPayment});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.r),
      border: Border.all(
        width: 1.2.r,
        color: isDark ? AppColors.activeBGColor : Color(0xFFB9F8CF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Offer ready',
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? AppColors.whiteColor : Color(0xFF0D542B),
          ),
          SizedBox(height: 12.h),
          CustomPrimaryText(
            text: 'Offer amount',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? AppColors.whiteColor : AppColors.secondaryTextColor,
          ),
          SizedBox(height: 4.h),
          CustomPrimaryText(
            text: amount,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.titleColor,
          ),
          SizedBox(height: 8.h),
          CustomPrimaryText(
            text:
                'Based on condition and market value. This offer is valid for 14 days.',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark
                ? AppColors.primaryBorderColor
                : AppColors.lightGreyColor,
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: CustomPrimaryButton(
                  text: 'Accept',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomPaymentSuccessDialog(
                          height: 340.h,
                          icon: IconsPath.success,
                          title: 'Thank you for accepting.',
                          sub:
                              'Kindly add your account information to receive payment',
                          widget: Padding(
                            padding: EdgeInsets.only(top: 12.h),
                            child: CustomPrimaryButton(
                              text: 'Add account information',
                              onPressed: onPayment,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: CustomPrimaryButton(
                  text: 'Decline',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomRejectDialog();
                      },
                    );
                  },
                  backgroundColor: AppColors.whiteColor,
                  textColor: Color(0xFFE7000B),
                  border: Border.all(
                    width: 1.r,
                    color: AppColors.buttonBorderColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
