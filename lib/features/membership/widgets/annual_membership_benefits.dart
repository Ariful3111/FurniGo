import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AnnualMembershipBenefits extends StatelessWidget {
  final String title;
  final String desc;
  final String icon;

  const AnnualMembershipBenefits({
    super.key,
    required this.title,
    required this.desc,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          SharedContainer(
            height: 40.h,
            width: 40.w,
            radius: 20.r,
            padding: EdgeInsets.zero,
            color: isDark ? AppColors.whiteColor : AppColors.primaryColor,
            child: Center(
              child: Image.asset(
                icon,
                height: 24.h,
                width: 24.w,
                color: isDark ? AppColors.darkColor : null,
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.whiteColor : AppColors.darkColor,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: desc,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color:isDark? AppColors.darkPrimaryTextColor:AppColors.darkGreyColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
