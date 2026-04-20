import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/membership/controller/subscription_controller.dart';
import 'package:zb_dezign/features/membership/widgets/active_annual_subscription.dart';
import 'package:zb_dezign/features/membership/widgets/active_subscription.dart';
import 'package:zb_dezign/features/membership/widgets/annual_membership_button.dart';
import 'package:zb_dezign/features/membership/widgets/annual_membership_feature.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AnnualMembershipPlan extends GetWidget<SubscriptionController> {
  final List<String> features;

  const AnnualMembershipPlan({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      padding: EdgeInsets.all(35.w),
      radius: 35.r,
      gradient: LinearGradient(
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
      ),
      border: Border.all(
        color: isDark ? AppColors.labelColor : AppColors.whiteColor,
        width: 8.87.r,
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 11.83),
          blurRadius: 41.4,
          color: AppColors.shadowColor.withValues(alpha: 0.1),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomPrimaryText(
                  text: "Annual Membership",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark ? AppColors.whiteColor : AppColors.darkColor,
                ),
              ),
              if (controller.isActive.value) ActiveSubscription(),
            ],
          ),
          SizedBox(height: 31.h),
          Row(
            children: [
              CustomPrimaryText(
                text: "\$199",
                fontSize: 32.sp,
                color: isDark ? AppColors.whiteColor : AppColors.darkColor,
              ),
              SizedBox(width: 6.w),
              CustomPrimaryText(
                text: "/AUD per year",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.darkGreyColor,
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomDivider(),
          SizedBox(height: 20.h),
          controller.isActive.value
              ? ActiveAnnualSubscription()
              : AnnualMembershipFeature(features: features),
          SizedBox(height: 20.h),
          AnnualMembershipButton(),
        ],
      ),
    );
  }
}
