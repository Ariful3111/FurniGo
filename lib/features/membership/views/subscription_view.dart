import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/membership/controller/subscription_controller.dart';
import 'package:zb_dezign/features/membership/widgets/annual_membership.dart';
import 'package:zb_dezign/features/membership/widgets/subscription_plan_card.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_header.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  const SubscriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient: LinearGradient(
        colors: isDark
            ? [AppColors.darkColor, AppColors.darkColor]
            : [Color(0xFFF6F6F6), Color(0xFFF6F6F6)],
      ),
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Membership',
            onDrawerTap: () => Navigator.pop(context),
            icon: IconsPath.back,
          ),
          SizedBox(height: 32.h),
          FlowHeader(
            title: 'ZB Designs Membership',
            sub:
                'Unlock exclusive benefits and transform your space with premium design services',
          ),
          SizedBox(height: 24.h),
          SharedContainer(
            child: Column(
              children: [
                CustomPrimaryText(
                  text: 'Choose The Plan That Fits\nYour Lifestyle',
                  color: isDark ? AppColors.whiteColor : AppColors.darkColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                CustomPrimaryText(
                  text:
                      'Flexible subscriptions designed for renting, buying, and designing furniture—upgrade, switch, or cancel anytime.',
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.darkGreyTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                ...List.generate(
                  controller.plans.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      bottom: controller.plans.length - 1 == index ? 0 : 12.h,
                    ),
                    child: SubscriptionPlanCard(data: controller.plans[index]),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          AnnualMembership(),
        ],
      ),
    );
  }
}
