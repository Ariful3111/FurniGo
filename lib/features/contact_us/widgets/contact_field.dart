import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/contact_us/controller/contact_us_controller.dart';
import 'package:zb_dezign/features/contact_us/widgets/contact_arrow_button.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ContactField extends GetWidget<ContactUsController> {
  const ContactField({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      padding: EdgeInsets.all(16.r),
      radius: 16.r,
      color: isDark ? AppColors.darkColor : AppColors.fieldColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildField(
            label: "First Name",
            controller: controller.firstNameController,
            text: 'First Name',
            isDark: isDark,
          ),
          SizedBox(height: 12.h),
          _buildField(
            label: "Last Name",
            controller: controller.lastNameController,
            text: 'Last Name',
            isDark: isDark,
          ),
          SizedBox(height: 12.h),
          _buildField(
            label: "Email Address",
            controller: controller.emailController,
            text: 'Email Address',
            isDark: isDark,
          ),
          SizedBox(height: 12.h),
          _buildField(
            label: "Your Message",
            maxLines: 4,
            controller: controller.messageController,
            text: 'Your Message',
            isDark: isDark,
            isAlignLabelWithHint: true,
          ),
          SizedBox(height: 20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ContactArrowButton(text: "Submit", onTap: () {}),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomPrimaryText(
                  text:
                      'Send us your details and let\'s start the conversation today',
                  fontSize: 14.sp,
                  color: isDark
                      ? AppColors.darkPrimaryTextColor
                      : AppColors.darkSecondaryTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String text,
    required bool isDark,
    bool? isAlignLabelWithHint,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: text,
          color: isDark ? AppColors.whiteColor : AppColors.buttonTextColor,
          fontSize: 14.sp,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller,
          labelText: label,
          maxLines: maxLines,
          isAlignLabelWithHint: isAlignLabelWithHint,
          fillColor: isDark?AppColors.darkColor:AppColors.whiteColor,

        ),
      ],
    );
  }
}
