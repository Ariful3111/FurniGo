import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/controller/forgot_password_controller.dart';
import 'package:zb_dezign/features/auth/widgets/auth_header.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle createStyle(Color color) {
      ThemeData theme = Theme.of(context);
      return theme.textTheme.headlineMedium?.copyWith(color: color) ??
          TextStyle(color: color);
    }

    List<TextStyle> otpStyle = [
      createStyle(AppColors.primaryColor),
      createStyle(AppColors.primaryColor),
      createStyle(AppColors.primaryColor),
      createStyle(AppColors.primaryColor),
      createStyle(AppColors.primaryColor),
    ];
    return CustomContainer(
      gradient: AppColors.authBG,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthHeader(),
            SizedBox(height: 32.h),
            CustomPrimaryText(
              text: 'Enter OTP',
              fontSize: 31.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.darkColor,
            ),
            SizedBox(height: 12.h),
            CustomPrimaryText(
              text:
                  'A verification email has been sent to your ${Get.find<ForgotPasswordController>().emailController.text}. Please check your mail for OTP.',
              fontSize: 16.sp,
              color: AppColors.buttonTextColor,
            ),
            SizedBox(height: 100.h),
            OtpTextField(
              numberOfFields: 5,
              borderColor: AppColors.primaryColor,
              focusedBorderColor: AppColors.primaryColor,
              borderWidth: 4.r,
              keyboardType: TextInputType.numberWithOptions(),
              styles: otpStyle,
              onCodeChanged: (value) {},
              onSubmit: (value) {},
            ),
            SizedBox(height: 50.h),
            CustomPrimaryButton(
              text: 'Submit',
              onPressed: () {
                Get.toNamed(AppRoutes.newPasswordView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
