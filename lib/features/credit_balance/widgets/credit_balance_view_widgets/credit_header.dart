import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CreditHeader extends StatelessWidget {
  const CreditHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPrimaryText(
              text: "Credit Usage",
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 4.h),
            CustomPrimaryText(
              text: "Track how your credits are\nconsumed over time",
              fontSize: 12.sp,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyTextColor,
            ),
          ],
        ),
        Spacer(),
        Image.asset(
          IconsPath.creditCoin,
          height: 14.h,
          width: 14.w,
          color: isDark ? AppColors.primaryBorderColor : null,
        ),
        SizedBox(width: 2.w),
        CustomPrimaryText(text: "Balance: 1250", fontSize: 14.sp),
      ],
    );
  }
}
