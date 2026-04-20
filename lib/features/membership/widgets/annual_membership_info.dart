import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/membership/widgets/annual_membership_benefits.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AnnualMembershipInfo extends StatelessWidget {
  final List<Map<String, String>> benefits;

  const AnnualMembershipInfo({super.key, required this.benefits});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        CustomPrimaryText(
          text: "Flexible Membership Plans For Every Need",
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 8.h),
        CustomPrimaryText(
          text:
              "From early access to premium services, choose a subscription that grows with your home and lifestyle.",
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
          color: isDark
              ? AppColors.primaryBorderColor
              : AppColors.darkGreyTextColor,
        ),
        SizedBox(height: 20.h),
        Column(
          children: List.generate(
            benefits.length,
            (index) => AnnualMembershipBenefits(
              title: benefits[index]["title"]!,
              desc: benefits[index]["desc"]!,
              icon: benefits[index]["icon"]!,
            ),
          ),
        ),
      ],
    );
  }
}
