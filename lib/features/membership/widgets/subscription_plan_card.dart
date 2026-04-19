import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/membership/controller/subscription_controller.dart';
import 'package:zb_dezign/features/membership/widgets/active_subscription.dart';
import 'package:zb_dezign/features/membership/widgets/expire_soon_button.dart';
import 'package:zb_dezign/features/membership/widgets/expired_button.dart';
import 'package:zb_dezign/features/membership/widgets/most_popular_plan.dart';
import 'package:zb_dezign/features/membership/widgets/subscription_plan_feature.dart';
import 'package:zb_dezign/features/membership/widgets/subscription_plan_price.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_payment_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SubscriptionPlanCard extends GetWidget<SubscriptionController> {
  final Map<String, dynamic> data;

  const SubscriptionPlanCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    bool isActive = data["isActive"] ?? false;
    bool isExpire = data["isExpire"] ?? false;
    bool isExpireSoon = data["isExpireSoon"] ?? false;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool isPrimary = data["isPrimary"] ?? false;
    bool isPremium = data['isPremium'] ?? false;
    return SharedContainer(
      padding: EdgeInsets.all(20.w),
      radius: 24.r,
      gradient: isPrimary
          ? LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.0, 0.23, 0.52, 1.0],
              colors: isDark
                  ? [
                      Color(0xFF052F50),
                      Color(0xFF0B1E2E),
                      Color(0xFF0D0D0D),
                      AppColors.darkColor,
                    ]
                  : [
                      Color(0xFFD4ECFF),
                      Color(0xFFE9F5FF),
                      AppColors.whiteColor,
                      AppColors.whiteColor,
                    ],
            )
          : LinearGradient(
              begin: isPremium ? Alignment.topRight : Alignment.bottomLeft,
              end: isPremium ? Alignment.bottomLeft : Alignment.topRight,
              stops: [0.0, 0.16, 0.59, 1.0],
              colors: isDark
                  ? [
                      Color(0xFF333333),
                      Color(0xFF262626),
                      Color(0xFF0D0D0D),
                      AppColors.darkColor,
                    ]
                  : [
                      Color(0xFFE8E8E8),
                      Color(0xFFE4E4E4),
                      AppColors.whiteColor,
                      AppColors.whiteColor,
                    ],
            ),
      border: Border.all(
        width: 6.r,
        color: isDark ? AppColors.labelColor : AppColors.whiteColor,
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 12,
          color: isDark
              ? AppColors.whiteColor.withValues(alpha: 0.08)
              : AppColors.shadowColor.withValues(alpha: 0.08),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubscriptionPlanPrice(data: data),
              if (data["badge"] != null) MostPopularPlan(data: data),
              if (isActive)
                Column(
                  children: [
                    ActiveSubscription(),
                    SizedBox(height: 16.h),
                    CustomPrimaryText(
                      text: 'Next Renewal on\n12 February 2026.',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColors.darkPrimaryTextColor
                          : Color(0xFF696969),
                    ),
                  ],
                ),
                if(isExpireSoon)ExpireSoonButton(),
                if(isExpire)ExpiredButton(),
            ],
          ),
          SizedBox(height: 20.h),
          CustomPrimaryButton(
            text: isActive ? 'Renew Now' : data["buttonText"],
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomPaymentDialog(
                    height: 400.h,
                    title: 'Confirm Your Subscription',
                    sub: 'You are one step away from exclusive benefits.',
                    priceText: 'Price:',
                    icon: IconsPath.success,
                    successTitle:
                        'Payment Successful!\nYou are currently into Design Plan 🎉',
                    successHeight: 350.h,
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
                  );
                },
              );
            },
            textColor: isActive
                ? isDark
                      ? Color(0xFFEEEEEE)
                      : AppColors.whiteColor
                : isPrimary
                ? AppColors.whiteColor
                : AppColors.labelColor,
            backgroundColor: isActive
                ? isDark
                      ? AppColors.greyTextColor
                      : AppColors.darkPrimaryTextColor
                : isPrimary
                ? AppColors.primaryColor
                : AppColors.whiteColor,
            border: Border.all(
              color: isDark
                  ? Colors.transparent
                  : isPrimary
                  ? AppColors.primaryColor
                  : AppColors.borderColor,
            ),
          ),
          SizedBox(height: 24.h),
          CustomDivider(),
          SizedBox(height: 28.h),
          Column(
            children: List.generate(
              data["features"].length,
              (index) => SubscriptionPlanFeature(text: data["features"][index]),
            ),
          ),
        ],
      ),
    );
  }
}
