import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zb_dezign/features/membership/controller/subscription_controller.dart';
import 'package:zb_dezign/features/membership/widgets/annual_membership_info.dart';
import 'package:zb_dezign/features/membership/widgets/annual_membership_plan.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AnnualMembership extends GetWidget<SubscriptionController> {
  const AnnualMembership({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedContainer(

      child: Column(
        children: [
          AnnualMembershipInfo(benefits: controller.membership),
          SizedBox(height: 24.h),
          AnnualMembershipPlan(features: controller.membershipPlanFeature),
        ],
      ),
    );
  }
}