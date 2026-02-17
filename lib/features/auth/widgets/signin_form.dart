import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/controller/signin_controller.dart';
import 'package:zb_dezign/features/auth/widgets/auth_helper.dart';
import 'package:zb_dezign/shared/extensions/validators/email_validator.dart';
import 'package:zb_dezign/shared/extensions/validators/password_validator.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SigninForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SigninForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    SigninController signinController = Get.find();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          authField(
            controller: signinController.email,
            labelText: 'Enter your email',
            validation: AutovalidateMode.onUserInteraction,
            validator: emailValidation,
            text: 'Email Address',
            icon: IconsPath.email, context: context,
          ),
          SizedBox(height: 20.h),
          SizedBox(height: 8.h),
          authField(
            controller: signinController.password,
            labelText: 'Enter your Password',
            validation: AutovalidateMode.onUserInteraction,
            validator: passwordValidation,
            text: 'Password *',
            icon: IconsPath.pass, context: context,
          ),
          SizedBox(height: 4.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Get.toNamed(AppRoutes.forgotPasswordView);
              },
              child: CustomPrimaryText(
                text: 'Forgot Password?',
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
