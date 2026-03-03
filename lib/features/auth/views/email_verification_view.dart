import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/auth/controller/signup_controller.dart';
import 'package:zb_dezign/features/auth/widgets/auth_header.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient:isDark? AppColors.darkAuthBG:AppColors.authBG,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthHeader(),
          SizedBox(height: 40.h),
          Image.asset(IconsPath.emailVerification, height: 40.h, width: 40.w),
          SizedBox(height: 40.h),
          CustomPrimaryText(
            text: 'Verify Your Email',
            color:isDark?AppColors.whiteColor: AppColors.darkColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 16.h),
          CustomPrimaryText(
            text:
                'A verification email has been sent to your ${Get.find<SignupController>().emailController.text}. Please check your mail to complete your registration.',
            fontSize: 16.sp,
            color:isDark?AppColors.primaryBorderColor: AppColors.buttonTextColor,
          ),
          SizedBox(height: 46.h),
          CustomPrimaryButton(
            height: 48.h,
            fontSize: 16.sp,
            text: 'Check My Inbox',
            onPressed: () {
              
            },
          ),
          SizedBox(height: 16.h),
          InkWell(
            onTap: () {},
            child: Center(
              child: CustomPrimaryText(
                text: 'Resend Email',
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Color(0xFF2DADE2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
