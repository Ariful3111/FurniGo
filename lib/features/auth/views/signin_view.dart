import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/auth/controller/signin_controller.dart';
import 'package:zb_dezign/features/auth/widgets/auth_header.dart';
import 'package:zb_dezign/features/auth/widgets/login_button.dart';
import 'package:zb_dezign/features/auth/widgets/signin_form.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    SigninController signinController = Get.find();
    final fromKey = GlobalKey<FormState>();
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
              text: 'Sign In',
              fontSize: 31.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.darkColor,
            ),
            SizedBox(height: 12.h),
            CustomSpanText(
              title: 'Don\'t have an account? ',
              spantext: 'Create New Account',
              onTap: () {
                signinController.signup(formKey: fromKey);
              },
            ),
            SizedBox(height: 24.h),
            SigninForm(formKey: fromKey),
            SizedBox(height: 20.h),
            Obx(() {
              return signinController.isLoading.value
                  ? ButtonLoading()
                  : CustomPrimaryButton(
                      text: 'Sign In',
                      onPressed: () async {
                        await signinController.userLogin(formKey: fromKey);
                      },
                    );
            }),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                divider(),
                CustomPrimaryText(text: 'Or', color: AppColors.buttonTextColor),
                divider(),
              ],
            ),
            SizedBox(height: 20.h),
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
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Container(
      height: 2.h,
      width: 170.w,
      decoration: BoxDecoration(
        color: AppColors.fieldBorderColor,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(width: 1.r, color: AppColors.fieldBorderColor),
      ),
    );
  }
}
