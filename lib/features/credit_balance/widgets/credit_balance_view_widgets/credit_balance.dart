import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_action_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CreditBalance extends StatelessWidget {
  const CreditBalance({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      radius: 16.r,
      border: Border.all(
        color: isDark
            ? AppColors.darkBorderColor
            : AppColors.primaryBorderColor,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.darkColor.withValues(alpha: 0.1),
          blurRadius: 20,
          offset: Offset(1, 6),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: "Current Credit Balance",
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 12.h),
          CustomSpanText(
            title: "1250",
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            spanText: "  Credits Available",
            spanFontSize: 14.sp,
            spanFontWeight: FontWeight.w400,
            color: isDark ? AppColors.whiteColor : AppColors.labelColor,
            spanColor: isDark
                ? AppColors.darkPrimaryTextColor
                : AppColors.greyTextColor,
          ),
          SizedBox(height: 4.h),
          CustomPrimaryText(
            text:
                "Last updated: Today\n Credits are used for AI interior designs & product placement",
            fontSize: 14.sp,
            color: isDark
                ? AppColors.darkPrimaryTextColor
                : AppColors.greyTextColor,
          ),
          SizedBox(height: 12.h),
          CustomTableActionButton(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            icon: IconsPath.arrowRight,
            text: "Purchase Credits",
            fontSize: 14.sp,
            backgroundColor: AppColors.secondaryColor,
            textColor:isDark? AppColors.darkColor:AppColors.whiteColor,
            iconColor: isDark? AppColors.darkColor:AppColors.whiteColor,
            onTap: () {},
            boxShadow: [
              shadow(dy: 98, blurRadius: 28, alpha: 0.0),
              shadow(dy: 63, blurRadius: 25, alpha: 0.01),
              shadow(dy: 35, blurRadius: 21, alpha: 0.05),
              shadow(dy: 16, blurRadius: 16, alpha: 0.09),
              shadow(dy: 4, blurRadius: 9, alpha: 0.1),
            ],
          ),
        ],
      ),
    );
  }

  BoxShadow shadow({
    required double dy,
    required double blurRadius,
    required double alpha,
  }) {
    return BoxShadow(
      offset: Offset(0, dy),
      blurRadius: blurRadius,
      color: AppColors.shadowColor.withValues(alpha: alpha),
    );
  }
}
