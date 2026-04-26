import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/membership/controller/subscription_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_dialog_animation.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_payment_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';

class AnnualMembershipButton extends GetWidget<SubscriptionController> {
  const AnnualMembershipButton({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        CustomPrimaryButton(
          backgroundColor: controller.isActive.value
              ? isDark
                    ? AppColors.greyTextColor
                    : AppColors.darkPrimaryTextColor
              : null,
          text: controller.isActive.value ? 'Renew Now' : "Join Membership Now",
          textColor: AppColors.whiteColor,
          onPressed: controller.isActive.value
              ? () {}
              : () {
                  CustomDialogAnimation().showAnimatedDialog(
                    context: context,
                    dialog: CustomPaymentDialog(
                      height: 400.h,
                      title: 'Confirm Your Subscription',
                      sub: 'You are one step away from exclusive benefits.',
                      priceText: 'Price:',
                      price: CustomSpanText(
                        title: '\$10',
                        fontSize: 20.sp,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        spanText: '/AUD per month',
                      ),
                      cardList: ['13265456', '654366565'],
                      selectedCard: controller.selectedCard,
                      onSelect: (value) {
                        controller.selectedCard.value = value!;
                      },
                    ),
                    isDark: isDark,
                  );
                },
        ),
        SizedBox(height: 10.h),
        Center(
          child: CustomPrimaryText(
            text: controller.isActive.value
                ? 'Your Membership is Currently Active.\nNext Renewal on 12 February 2026.'
                : "Cancel anytime. No hidden fees.",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark
                ? AppColors.darkPrimaryTextColor
                : AppColors.darkGreyTextColor,
          ),
        ),
      ],
    );
  }
}
