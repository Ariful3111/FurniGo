import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/controller/new_password_controller.dart';
import 'package:zb_dezign/features/auth/widgets/auth_header.dart';
import 'package:zb_dezign/features/auth/widgets/auth_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient: isDark ? AppColors.darkAuthBG : AppColors.authBG,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthHeader(),
            SizedBox(height: 32.h),
            CustomPrimaryText(
              text: 'Set New Password',
              fontSize: 31.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.darkColor,
            ),
            SizedBox(height: 12.h),
            CustomPrimaryText(
              text: 'Must be at least 8 characters',
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.buttonTextColor,
            ),
            SizedBox(height: 24.h),
            authField(
              text: 'Password *',
              labelText: 'Enter your Password',
              controller: controller.passwordController,
              icon: IconsPath.pass,
              context: context,
            ),
            SizedBox(height: 20.h),
            authField(
              text: 'Confirm Password *',
              labelText: 'Re-Enter your Password',
              controller: controller.confirmPasswordController,
              icon: IconsPath.pass,
              context: context,
            ),
            SizedBox(height: 20.h),
            CustomPrimaryButton(
              height: 48.h,
              fontSize: 16.sp,
              text: 'Continue',
              onPressed: () {}),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.signInView);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 20.sp,
                    color: isDark ? AppColors.whiteColor : AppColors.darkColor,
                  ),
                  SizedBox(width: 12.w),
                  CustomPrimaryText(
                    text: 'Back to log in',
                    fontSize: 16.sp,
                    color: isDark ? AppColors.whiteColor : AppColors.darkColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
