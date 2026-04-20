import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/membership/controller/subscription_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AnnualMembershipFeature extends GetWidget<SubscriptionController> {
  final List<String> features;
  const AnnualMembershipFeature({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      
      children: List.generate(
        features.length,
        (index) => Padding(
          padding: EdgeInsets.only(
            bottom: features.length - 1 == index ? 0 : 20.h,
          ),
          child: Row(
            children: [
              Image.asset(IconsPath.check, height: 16.h, width: 16.w),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomPrimaryText(
                  text: features[index],
                  fontSize: 13.sp,
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.darkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
