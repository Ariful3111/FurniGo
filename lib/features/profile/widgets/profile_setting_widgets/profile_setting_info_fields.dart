import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/profile/controllers/profile_update_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProfileSettingInfoFields extends GetWidget<ProfileUpdateController> {
  const ProfileSettingInfoFields({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          field(
            controller: controller.nameController,
            text: 'Full Name',
            isDark: isDark,
            labelText: 'Enter your name',
            readOnly: !controller.isEdit.value,
          ),
          SizedBox(height: 12.h),
          field(
            controller: controller.emailController,
            text: 'Email',
            isDark: isDark,
            labelText: 'Enter your email',
            readOnly: !controller.isEdit.value,
          ),
          SizedBox(height: 12.h),
          field(
            controller: controller.phoneController,
            text: 'Phone',
            isDark: isDark,
            labelText: 'Enter your phone number',
            readOnly: !controller.isEdit.value,
          ),
          SizedBox(height: 12.h),
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: controller.isEdit.value
                ? Column(
                    key: ValueKey('Save'),
                    children: [
                      SizedBox(height: 12.h),
                      CustomPrimaryButton(
                        boxShadow: [
                          boxShadow(dy: 2, blurRadius: 4, alpha: 0.1),
                          boxShadow(dy: 7, blurRadius: 7, alpha: 0.09),
                          boxShadow(dy: 16, blurRadius: 10, alpha: 0.05),
                          boxShadow(dy: 28, blurRadius: 11, alpha: 0.01),
                          boxShadow(dy: 44, blurRadius: 12, alpha: 0.0),
                        ],
                        width: 150.w,
                        text: 'Save Changes',
                        onPressed: () {
                          controller.isEdit.value = !controller.isEdit.value;
                        },
                      ),
                    ],
                  )
                : SizedBox.shrink(key: ValueKey('empty')),
          ),
        ],
      ),
    );
  }

  Widget field({
    required TextEditingController controller,
    required String text,
    required String labelText,
    required bool isDark,
    required bool readOnly,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          controller: controller,
          borderWidth: 1.2.r,
          labelText: labelText,
          readOnly: readOnly,
        ),
      ],
    );
  }

  BoxShadow boxShadow({
    required double dy,
    required double blurRadius,
    required double alpha,
  }) {
    return BoxShadow(
      offset: Offset(0, dy),
      blurRadius: blurRadius,
      color: AppColors.darkColor.withValues(alpha: alpha),
    );
  }
}
