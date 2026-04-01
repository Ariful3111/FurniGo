import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
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
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_phone_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SignupForm extends GetWidget<SignupController> {
  final GlobalKey<FormState> formKey;
  const SignupForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    UserModeController userModeController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
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
            controller: controller.nameController,
            icon: userModeController.selectedIndex.value == 0
                ? IconsPath.user
                : IconsPath.bag,
            validation: AutovalidateMode.onUserInteraction,
            validator: nameValidation,
            context: context,
          ),
          SizedBox(height: 22.h),
          authField(
            text: 'Email *',
            labelText: userModeController.selectedIndex.value == 0
                ? 'Enter your email'
                : 'Enter your business email',
            controller: controller.emailController,
            icon: IconsPath.email,
            validation: AutovalidateMode.onUserInteraction,
            validator: emailValidation,
            context: context,
          ),
          SizedBox(height: 22.h),
          authField(
            text: 'Password *',
            labelText: 'Enter your password',
            controller: controller.passwordController,
            icon: IconsPath.pass,
            validation: AutovalidateMode.onUserInteraction,
            validator: passwordValidation,
            context: context,
          ),
          SizedBox(height: 22.h),
          authField(
            text: 'Confirm Password *',
            labelText: 'Re-Enter your password',
            controller: controller.confirmPasswordController,
            icon: IconsPath.pass,
            validation: AutovalidateMode.onUserInteraction,
            validator: (value) => confirmPasswordValidation(
              controller.passwordController.text,
              value,
            ),
            context: context,
          ),
          SizedBox(height: 22.h),
          CustomPrimaryText(
        text: 'Phone Number *',
        fontSize: 16.sp,
        color: isDark
            ? AppColors.primaryBorderColor
            : AppColors.buttonTextColor,
      ),
      SizedBox(height: 8.h),
          CustomPhoneField(
            validation: AutovalidateMode.onUserInteraction,
            validator: phoneValidation,
            controller: controller.phoneController,
            labelText: 'Enter Your Phone Number',
            borderColor: isDark
                ? AppColors.darkBorderColor
                : AppColors.fieldBorderColor,
            fillColor: isDark ? AppColors.labelColor : AppColors.fieldColor,
            borderRadius: 12.r,
          ),
          if (userModeController.selectedIndex.value == 1)
            SizedBox(height: 22.h),
          if (userModeController.selectedIndex.value == 1)
            authField(
              text: 'ABN Number *',
              labelText: 'Enter ABN number',
              controller: controller.abnController,
              icon: IconsPath.file,
              validation: AutovalidateMode.onUserInteraction,
              validator: abnValidation,
              context: context,
            ),
        ],
      ),
    );
  }
}
