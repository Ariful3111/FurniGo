import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/contact_us/widgets/contact_arrow_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ContactHeader extends StatelessWidget {
  const ContactHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Get in touch with us',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        CustomPrimaryText(
          text:
              'We\'re here to answer questions, discuss ideas, and help you move forward—reach out anytime and let’s start building something meaningful together with confidence today.',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: isDark
              ? AppColors.darkPrimaryTextColor
              : AppColors.darkGreyTextColor,
        ),
        SizedBox(height: 24.h),
        _infoTile(
          title: "Email:",
          value: "zbdesign@furniture.com",
          isDark: isDark,
        ),
        SizedBox(height: 12.h),
        _infoTile(title: "Phone:", value: "+3659 5496 87 632", isDark: isDark),
        SizedBox(height: 12.h),
        CustomPrimaryText(
          text: "Available Monday to Friday, 9 AM - 7 PM GMT",
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: isDark
              ? AppColors.darkPrimaryTextColor
              : AppColors.lightTextColor,
        ),
        SizedBox(height: 20.h),
        ContactArrowButton(text: 'Live Chat', onTap: () {}),
      ],
    );
  }

  Widget _infoTile({
    required String title,
    required String value,
    required bool isDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 16.sp,
          color: isDark
              ? AppColors.darkPendingTextColor
              : AppColors.darkGreyTextColor,
        ),
        SizedBox(height: 8.h),
        CustomPrimaryText(
          text: value,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.buttonTextColor,
        ),
      ],
    );
  }
}
