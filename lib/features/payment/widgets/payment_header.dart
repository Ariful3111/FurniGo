import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class PaymentHeader extends StatelessWidget {
  final String icon1;
  final String title;
  final String sub;
  final String icon2;
  final String buttonText;
  final VoidCallback onTap;
  const PaymentHeader({
    super.key,
    required this.icon1,
    required this.title,
    required this.sub,
    required this.icon2,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          icon1,
          height: 24.h,
          width: 24.w,
          color: isDark ? AppColors.whiteColor : AppColors.titleColor,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.whiteColor : AppColors.titleColor,
              ),
              SizedBox(height: 4.h),
              CustomPrimaryText(
                text: sub,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : Color(0xFF6B7280),
              ),
            ],
          ),
        ),
        CustomSecondaryButton(
          text: buttonText,
          icon: icon2,
          onPressed: onTap,
          iconColor: AppColors.labelColor,
        ),
      ],
    );
  }
}
