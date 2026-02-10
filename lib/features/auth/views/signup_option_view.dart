import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/controller/signup_option_controller.dart';
import 'package:zb_dezign/features/auth/controller/user_mode_controller.dart';
import 'package:zb_dezign/features/auth/widgets/auth_check_box.dart';
import 'package:zb_dezign/features/auth/widgets/auth_header.dart';
import 'package:zb_dezign/features/auth/widgets/login_button.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class SignupOptionView extends StatelessWidget {
  const SignupOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    UserModeController userModeController = Get.find();
    SignupOptionController signupOptionController = Get.find();
    return CustomContainer(
      gradient: AppColors.authBG,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AuthHeader(),
          SizedBox(height: 16.h),
          CustomSpanText(
            title: 'Already have an account? ',
            spantext: 'Login Now',
            onTap: () {
              Get.toNamed(AppRoutes.signInView);
            },
          ),
          SizedBox(height: 40.h),
          userModeController.selectedIndex.value == 0
              ? CustomPrimaryText(
                  text: 'Sign up for your personal account',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkColor,
                )
              : CustomPrimaryText(
                  text: 'Sign up for your business account',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.darkColor,
                ),
          SizedBox(height: 32.h),
          LoginButton(
            onTap: () {},
            icon: IconsPath.google,
            title: 'Continue With Goggle',
            radius: 12.r,
          ),
          SizedBox(height: 16.h),
          LoginButton(
            onTap: () {},
            icon: IconsPath.apple,
            title: 'Continue With Apple',
            radius: 12.r,
          ),
          SizedBox(height: 16.h),
          LoginButton(
            onTap: () {},
            icon: IconsPath.gmail,
            title: 'Continue With email',
            radius: 12.r,
          ),
          SizedBox(height: 16.h),
          Obx(
            () => AuthCheckBox(
              isChecked: signupOptionController.isChecked.value,
              onChange: (value) {
                signupOptionController.isChecked.value = value;
              },
            ),
          ),
          SizedBox(height: 32.h),
          Obx(
            () => CustomPrimaryButton(
              text: 'Continue',
              backgroundColor: !signupOptionController.isChecked.value
                  ? AppColors.buttonTextColor
                  : null,
              onPressed: () {
                if (signupOptionController.isChecked.value) {
                  Get.toNamed(AppRoutes.signUpView);
                } else {
                  ErrorSnackbar.show(description: 'Please Agree to the Terms & Privacy Policy');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
