import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/profile/controllers/profile_setting_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_phone_field.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AddNewAddressDialogFields extends GetWidget<ProfileSettingController> {
  const AddNewAddressDialogFields({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(text: 'Address Label', isDark: isDark),
        field(
          controller: controller.addressLabelController,
          labelText: 'e.g., Home, Work, Warehouse..',
        ),
        SizedBox(height: 16.h),
        title(text: 'Full Name', isDark: isDark),
        field(
          controller: controller.dialogNameController,
          labelText: 'Enter Your Name',
        ),
        SizedBox(height: 16.h),
        title(text: 'Address', isDark: isDark),
        field(
          controller: controller.dialogAddressController,
          suffixIcon: Padding(
            padding: EdgeInsetsGeometry.only(right: 12.w),
            child: Image.asset(IconsPath.search, height: 20.h, width: 20.w),
          ),
          labelText: 'Enter Your Address',
        ),
        SizedBox(height: 16.h),
        text(text: 'City', isDark: isDark),
        SizedBox(height: 8.h),
        field(controller: controller.dialogCityController, labelText: 'Select City'),
        SizedBox(height: 20.h),
        text(text: 'State', isDark: isDark),
        SizedBox(height: 8.h),
        field(controller: controller.dialogStateController, labelText: 'Select State'),
        SizedBox(height: 20.h),
        text(text: 'Zip Code', isDark: isDark),
        SizedBox(height: 8.h),
        field(
          controller: controller.dialogZipController,
          labelText: 'Enter Zip Code',
        ),
        SizedBox(height: 16.h),
        text(text: 'Phone', isDark: isDark),
        SizedBox(height: 8.h),
        SizedBox(
          height: 44.h,
          child: CustomPhoneField(
            controller: controller.dialogPhoneController,
            labelText: 'Enter Your Phone Number',
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Obx(
              () => CustomCheckBox(
                isChecked: controller.isDefault.value,
                onChange: (value) {
                  controller.isDefault.value = value;
                },
              ),
            ),

            CustomPrimaryText(
              text: 'Set as default delivery address',
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.buttonTextColor,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        CustomPrimaryButton(text: 'Save', onPressed: () {}),
      ],
    );
  }

  Widget title({required String text, required bool isDark}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomPrimaryText(
        text: text,
        color: isDark ? AppColors.whiteColor : AppColors.fieldTextColorDark,
        fontSize: 14.sp,
      ),
    );
  }

  Widget field({
    required TextEditingController controller,
    required String labelText,
    Widget? suffixIcon,
  }) {
    return SizedBox(
      height: 44.h,
      child: CustomTextFormField(
        controller: controller,
        padding: EdgeInsets.all(4.r),
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelFontSize: 14.sp,
        labelFontWeight: FontWeight.w400,
      ),
    );
  }
}
