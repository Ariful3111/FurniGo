import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/controller/forgot_password_controller.dart';
import 'package:zb_dezign/features/auth/widgets/auth_header.dart';
import 'package:zb_dezign/features/auth/widgets/auth_helper.dart';
import 'package:zb_dezign/shared/extensions/validators/email_validator.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    ForgotPasswordController forgotPasswordController = Get.find();
    return CustomContainer(
      gradient:isDark?AppColors.darkAuthBG: AppColors.authBG,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthHeader(),
            SizedBox(height: 32.h),
            CustomPrimaryText(
              text: 'Reset Password',
              fontSize: 31.sp,
              fontWeight: FontWeight.w600,
              color:isDark?AppColors.whiteColor: AppColors.darkColor,
            ),
            SizedBox(height: 12.h),
            CustomSpanText(
              title: 'Don\'t have an account? ',
              spantext: 'Create New Account',
              onTap: () {
                Get.toNamed(AppRoutes.signUpView);
                forgotPasswordController.emailController.clear();
              },
              decoration: TextDecoration.underline,
            ),
            SizedBox(height: 100.h),
            authField(
              text: 'Email Address',
              labelText: 'Enter Your Email Address',
              controller: forgotPasswordController.emailController,
              icon: IconsPath.email,
              validation: AutovalidateMode.onUserInteraction,
              validator: emailValidation, context: context,
            ),
            SizedBox(height: 24.h),
            CustomPrimaryButton(
              text: 'Send OTP',
              onPressed: () {
                Get.toNamed(AppRoutes.otpView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
