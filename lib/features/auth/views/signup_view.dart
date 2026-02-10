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

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final fromKey = GlobalKey<FormState>();
    UserModeController userModeController = Get.find();
    SignupController signupController = Get.find();
    return CustomContainer(
      gradient: AppColors.authBG,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    text: 'Create your personal account.',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor,
                  )
                : CustomPrimaryText(
                    text: 'Create your Business account.',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor,
                  ),
            SizedBox(height: 22.h),
            SignupForm(formKey: fromKey),
            SizedBox(height: 35.h),
            Obx(
              () => AuthCheckBox(
                isChecked: signupController.isChecked.value,
                onChange: (value) {
                  signupController.isChecked.value = value;
                },
              ),
            ),
            SizedBox(height: 32.h),
            Obx(() {
              return signupController.isLoading.value
                  ? ButtonLoading()
                  : CustomPrimaryButton(
                      text: 'Sign Up',
                      backgroundColor:signupController.isChecked.value?null:AppColors.buttonTextColor ,
                      onPressed: () async {
                        if(signupController.isChecked.value){await signupController.register(formKey: fromKey);}else{
                          ErrorSnackbar.show(description: 'Please Agree to the Terms & Privacy Policy');
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
