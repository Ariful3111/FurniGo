import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/data/global_models/google_user_info_model.dart';
import 'package:zb_dezign/core/services/firebase_google_auth.dart';
import 'package:zb_dezign/features/auth/controller/google_login_controller.dart';
import 'package:zb_dezign/features/auth/controller/signin_controller.dart';
import 'package:zb_dezign/features/auth/widgets/auth_header.dart';
import 'package:zb_dezign/features/auth/widgets/login_button.dart';
import 'package:zb_dezign/features/auth/widgets/signin_form.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final fromKey = GlobalKey<FormState>();
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
              text: 'Sign In',
              fontSize: 31.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.darkColor,
            ),
            SizedBox(height: 12.h),
            CustomSpanText(
              title: 'Don\'t have an account? ',
              spanText: 'Create New Account',
              onTap: () {
                controller.signup(formKey: fromKey);
              },
              decoration: TextDecoration.underline,
            ),
            SizedBox(height: 24.h),
            SigninForm(formKey: fromKey),
            SizedBox(height: 20.h),
            Obx(() {
              return controller.isLoading.value
                  ? ButtonLoading()
                  : CustomPrimaryButton(
                      height: 48.h,
                      fontSize: 16.sp,
                      text: 'Sign In',
                      onPressed: () async {
                        await controller.userLogin(formKey: fromKey);
                      },
                    );
            }),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDivider(),
                CustomPrimaryText(text: 'Or', color: AppColors.buttonTextColor),
                CustomDivider(),
              ],
            ),
            SizedBox(height: 20.h),
            Obx(() {
              return Get.find<GoogleLoginController>().isLoading.value
                  ? ButtonLoading()
                  : LoginButton(
                      onTap: () async {
                        GoogleUserInfoModel? user =
                            await FirebaseGoogleAuthService.signInWithGoogle();
                        await Get.find<GoogleLoginController>().googleLogin(
                          user: user!,
                        );
                      },
                      icon: IconsPath.google,
                      title: 'Continue With Goggle',
                      radius: 12.r,
                    );
            }),
            SizedBox(height: 16.h),
            LoginButton(
              onTap: () {},
              icon: IconsPath.apple,
              iconColor: isDark ? AppColors.whiteColor : null,
              title: 'Continue With Apple',
              radius: 12.r,
            ),
          ],
        ),
      ),
    );
  }
}
