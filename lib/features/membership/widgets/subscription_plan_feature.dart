import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SubscriptionPlanFeature extends StatelessWidget {
  final String text;
  const SubscriptionPlanFeature({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
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
}
