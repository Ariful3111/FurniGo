import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final Map<String, dynamic> data;

  const SubscriptionPlanCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
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
              colors: [
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
              colors: [
                Color(0xFFE8E8E8),
                Color(0xFFE4E4E4),
                AppColors.whiteColor,
                AppColors.whiteColor,
              ],
            ),
      border: Border.all(
        width: 6.r,
        color: isDark ? AppColors.darkBorderColor : AppColors.whiteColor,
      ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 12,
          color: AppColors.shadowColor.withValues(alpha: 0.08),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleAndPrice(context),
              if (data["badge"] != null) _buildBadge(),
            ],
          ),
          SizedBox(height: 20.h),
          CustomPrimaryButton(
            text: data["buttonText"],
            onPressed: () {},
            textColor: isPrimary ? AppColors.whiteColor : AppColors.labelColor,
            backgroundColor: isPrimary
                ? AppColors.primaryColor
                : AppColors.whiteColor,
            border: Border.all(
              color: isPrimary ? AppColors.primaryColor : AppColors.borderColor,
            ),
          ),
          SizedBox(height: 24.h),
          CustomDivider(),
          SizedBox(height: 28.h),
          Column(
            children: List.generate(
              data["features"].length,
              (index) => _buildFeatureItem(context, data["features"][index]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleAndPrice(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: data["title"],
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 20.h),
        CustomPrimaryText(
          text: 'Start at',
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
          fontSize: 14.sp,
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            CustomPrimaryText(
              text: data["price"],
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.darkColor,
            ),
            SizedBox(width: 4.w),
            CustomPrimaryText(
              text: "/Month",
              fontSize: 12.sp,
              color: AppColors.greyTextColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureItem(BuildContext context, String text) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Image.asset(IconsPath.check, height: 16.h, width: 16.w),
          SizedBox(width: 8.w),
          Expanded(
            child: CustomPrimaryText(
              text: text,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge() {
    return SharedContainer(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      radius: 8.r,
      color: AppColors.whiteColor,
      border: Border.all(color: AppColors.darkColor),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 12,
          color: AppColors.shadowColor.withValues(alpha: 0.08),
        ),
      ],
      child: Row(
        children: [
          Image.asset(IconsPath.fire, height: 16.h, width: 16.w),
          SizedBox(width: 8.w),
          CustomPrimaryText(
            text: data["badge"],
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.buttonTextColor,
          ),
        ],
      ),
    );
  }
}
