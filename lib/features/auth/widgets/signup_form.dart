import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/auth/controller/signup_controller.dart';
import 'package:zb_dezign/features/auth/controller/user_mode_controller.dart';
import 'package:zb_dezign/features/auth/widgets/auth_helper.dart';
import 'package:zb_dezign/shared/extensions/validators/abn_validator.dart';
import 'package:zb_dezign/shared/extensions/validators/confirm_password_validator.dart';
import 'package:zb_dezign/shared/extensions/validators/email_validator.dart';
import 'package:zb_dezign/shared/extensions/validators/name_validator.dart';
import 'package:zb_dezign/shared/extensions/validators/password_validator.dart';
import 'package:zb_dezign/shared/extensions/validators/phone_validator.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const SignupForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.find();
    UserModeController userModeController = Get.find();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          authField(
            text: 'Full Name *',
            labelText: userModeController.selectedIndex.value == 0
                ? 'Enter your  name'
                : 'Enter your business name',
            controller: signupController.nameController,
            icon: userModeController.selectedIndex.value == 0
                ? IconsPath.user
                : IconsPath.bag,
            validation: AutovalidateMode.onUserInteraction,
            validator: nameValidation,
          ),
          SizedBox(height: 22.h),
          authField(
            text: 'Email *',
            labelText: userModeController.selectedIndex.value == 0
                ? 'Enter your email'
                : 'Enter your business email',
            controller: signupController.emailController,
            icon: IconsPath.email,
            validation: AutovalidateMode.onUserInteraction,
            validator: emailValidation,
          ),
          SizedBox(height: 22.h),
          authField(
            text: 'Password *',
            labelText: 'Enter your password',
            controller: signupController.passwordController,
            icon: IconsPath.pass,
            validation: AutovalidateMode.onUserInteraction,
            validator: passwordValidation,
          ),
          SizedBox(height: 22.h),
          authField(
            text: 'Confirm Password *',
            labelText: 'Re-Enter your password',
            controller: signupController.confirmPasswordController,
            icon: IconsPath.pass,
            validation: AutovalidateMode.onUserInteraction,
            validator: (value)=>confirmPasswordValidation(signupController.passwordController.text, value),
          ),
          SizedBox(height: 22.h),
          authField(
            text: 'Phone Number *',
            labelText: userModeController.selectedIndex.value == 0
                ? 'Enter your phone number'
                : 'Enter your business phone number',
            controller: signupController.phoneController,
            icon: IconsPath.phone,
            validation: AutovalidateMode.onUserInteraction,
            validator: phoneValidation,
          ),
          if (userModeController.selectedIndex.value == 1)
            SizedBox(height: 22.h),
          if (userModeController.selectedIndex.value == 1)
            authField(
              text: 'ABN Number *',
              labelText: 'Enter ABN number',
              controller: signupController.abnController,
              icon: IconsPath.file,
              validation: AutovalidateMode.onUserInteraction,
              validator: abnValidation,
            ),
        ],
      ),
    );
  }
}
