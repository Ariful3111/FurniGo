import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/controller/signup_controller.dart';
import 'package:zb_dezign/features/auth/controller/user_mode_controller.dart';
import 'package:zb_dezign/features/auth/widgets/auth_check_box.dart';
import 'package:zb_dezign/features/auth/widgets/auth_header.dart';
import 'package:zb_dezign/features/auth/widgets/signup_form.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark; 
    final fromKey = GlobalKey<FormState>();
    UserModeController userModeController = Get.find();
    return CustomContainer(
      gradient:isDark?AppColors.darkAuthBG: AppColors.authBG,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    text: 'Create your personal account',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color:isDark?AppColors.whiteColor: AppColors.darkColor,
                  )
                : CustomPrimaryText(
                    text: 'Create your Business account',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color:isDark?AppColors.whiteColor: AppColors.darkColor,
                  ),
            SizedBox(height: 22.h),
            SignupForm(formKey: fromKey),
            SizedBox(height: 35.h),
            Obx(
              () => AuthCheckBox(
                isChecked: controller.isChecked.value,
                onChange: (value) {
                  controller.isChecked.value = value;
                },
              ),
            ),
            SizedBox(height: 32.h),
            Obx(() {
              return controller.isLoading.value
                  ? ButtonLoading()
                  : CustomPrimaryButton(
                      height: 48.h,
                      fontSize: 16.sp,
                      text: 'Sign Up',
                      backgroundColor: controller.isChecked.value
                          ? null
                          : AppColors.buttonTextColor,
                      onPressed: () async {
                        if (controller.isChecked.value) {
                          await controller.register(formKey: fromKey);
                        } else {
                          ErrorSnackbar.show(
                            description:
                                'Please Agree to the Terms & Privacy Policy',
                          );
                        }
                      },
                    );
            }),
            SizedBox(height: 33.h),
          ],
        ),
      ),
    );
  }
}
