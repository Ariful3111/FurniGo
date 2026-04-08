import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/shared/extensions/validators/email_validator.dart';
import 'package:zb_dezign/shared/extensions/validators/name_validator.dart';
import 'package:zb_dezign/shared/extensions/validators/phone_validator.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_phone_field.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentRequestViewForm extends GetWidget<RentRequestController> {
  final GlobalKey<FormState> formKey;
  const RentRequestViewForm({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPrimaryText(
              text: 'Business Identification',
              fontWeight: FontWeight.w600,
              color: AppColors.darkColor,
            ),
            SizedBox(height: 24.h),
            myField(
              text: 'Business Name *',
              controller: controller.businessNameController,
              labeText: 'Enter Business Name',
              validation: AutovalidateMode.onUserInteraction,
              validator: nameValidation, isDark: isDark,
            ),
            SizedBox(height: 24.h),
            myField(
              text: 'Contact Person Name *',
              controller: controller.personNameController,
              labeText: 'Enter Contact Person Name',
              validation: AutovalidateMode.onUserInteraction,
              validator: nameValidation, isDark: isDark,
            ),
            SizedBox(height: 24.h),
            myField(
              text: 'Email Address *',
              controller: controller.emailController,
              labeText: 'Enter Email Address',
              validation: AutovalidateMode.onUserInteraction,
              validator: emailValidation, isDark: isDark,
            ),
            SizedBox(height: 24.h),
            CustomPrimaryText(
              text: 'Phone Phone *',
              color: isDark?AppColors.whiteColor: AppColors.darkTextColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8.h),
            CustomPhoneField(
              controller: controller.phoneController,
              labelText: 'Enter Phone Number',
              validation: AutovalidateMode.onUserInteraction,
              validator: phoneValidation,
            ),
            SizedBox(height: 24.h),
            myField(
              text: 'ABN',
              controller: controller.abnController,
              labeText: 'Enter ABN', isDark: isDark,
            ),
            SizedBox(height: 24.h),
            myField(
              text: 'Business Website / Company Profile Link',
              controller: controller.businessSiteController,
              labeText: 'Enter Link', isDark: isDark,
            ),
          ],
        ),
      ),
    );
  }

  Widget myField({
    required String text,
    required String labeText,
    required TextEditingController controller,
    required bool isDark,
    AutovalidateMode? validation,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: text,
          color: isDark?AppColors.whiteColor: AppColors.darkTextColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller,
          labelColor: AppColors.labelColor,
          fillColor:isDark? AppColors.labelColor:AppColors.whiteColor,
          borderRadius: 16.r,
          borderColor:isDark?AppColors.darkBorderColor: Color(0xFFE5E7EB),
          borderWidth: 1.2.r,
          labelText: labeText,
          validation: validation,
          validator: validator,
        ),
      ],
    );
  }
}
