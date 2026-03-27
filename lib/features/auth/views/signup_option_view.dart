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

class SignupOptionView extends GetView<SignupOptionController> {
  const SignupOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    UserModeController userModeController = Get.find();
    return CustomContainer(
      gradient: isDark ? AppColors.darkAuthBG : AppColors.authBG,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AuthHeader(),
          SizedBox(height: 16.h),
          CustomSpanText(
            title: 'Already have an account? ',
            spanText: 'Login Now',
            onTap: () {
              Get.toNamed(AppRoutes.signInView);
            },
            decoration: TextDecoration.underline,
          ),
          SizedBox(height: 40.h),
          userModeController.selectedIndex.value == 0
              ? CustomPrimaryText(
                  text: 'Sign up for your personal account',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.darkColor,
                )
              : CustomPrimaryText(
                  text: 'Sign up for your business account',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.darkColor,
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
            iconColor: isDark ? AppColors.whiteColor : null,
            radius: 12.r,
          ),
          SizedBox(height: 16.h),
          LoginButton(
            onTap: () {
              if (controller.isChecked.value) {
                  Get.toNamed(AppRoutes.signUpView);
                } else {
                  ErrorSnackbar.show(
                    description: 'Please Agree to the Terms & Privacy Policy',
                  );
                }
            },
            icon: IconsPath.authEmail,
            title: 'Continue With email',
            radius: 12.r,
          ),
          SizedBox(height: 16.h),
          Obx(
            () => AuthCheckBox(
              isChecked: controller.isChecked.value,
              onChange: (value) {
                controller.isChecked.value = value;
              },
            ),
          ),
          SizedBox(height: 32.h),
          Obx(
            () => CustomPrimaryButton(
              height: 48.h,
              fontSize: 16.sp,
              text: 'Continue',
              backgroundColor: !controller.isChecked.value
                  ? AppColors.buttonTextColor
                  : null,
              onPressed: () {
                if (controller.isChecked.value) {
                  Get.toNamed(AppRoutes.signUpView);
                } else {
                  ErrorSnackbar.show(
                    description: 'Please Agree to the Terms & Privacy Policy',
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
