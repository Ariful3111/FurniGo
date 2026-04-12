import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AnnualMembershipPlan extends StatelessWidget {
  final List<String> features;

  const AnnualMembershipPlan({super.key, required this.features});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      padding: EdgeInsets.all(20.w),
      radius: 24.r,
      gradient: LinearGradient(
        colors: [
          AppColors.primaryColor.withOpacity(0.1),
          AppColors.whiteColor,
        ],
      ),
      border: Border.all(color: AppColors.borderColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title & Price
          CustomPrimaryText(
            text: "Annual Membership",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),

          SizedBox(height: 8.h),

          Row(
            children: [
              CustomPrimaryText(
                text: "\$199",
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: 6.w),
              CustomPrimaryText(
                text: "/AUD per year",
                fontSize: 12.sp,
                color: AppColors.greyTextColor,
              ),
            ],
          ),

          SizedBox(height: 20.h),
          Column(
            children: List.generate(
              features.length,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  children: [
                    Image.asset(IconsPath.check, height: 16.h, width: 16.w),
                    SizedBox(width: 8.w),
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
          ),

          SizedBox(height: 20.h),

          /// Button
          CustomPrimaryButton(
            text: "Join Membership Now",
            onPressed: () {},
          ),

          SizedBox(height: 10.h),

          Center(
            child: CustomPrimaryText(
              text: "Cancel anytime. No hidden fees.",
              fontSize: 12.sp,
              color: AppColors.greyTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
