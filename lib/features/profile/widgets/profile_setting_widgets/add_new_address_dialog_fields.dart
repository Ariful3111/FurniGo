import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/profile/controllers/add_address_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_phone_field.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:intl_phone_field/phone_number.dart';

class AddNewAddressDialogFields extends GetWidget<AddAddressController> {
  const AddNewAddressDialogFields({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(text: 'Address Label', isDark: isDark),
        field(
          controller: controller.controllers['label']!,
          labelText: 'e.g., Home, Work, Warehouse..',
        ),
        SizedBox(height: 16.h),
        title(text: 'Full Name', isDark: isDark),
        field(
          controller: controller.controllers['name']!,
          labelText: 'Enter Your Name',
        ),
        SizedBox(height: 16.h),
        title(text: 'Address Line 1', isDark: isDark),
        field(
          controller: controller.controllers['address1']!,
          suffixIcon: Padding(
            padding: EdgeInsetsGeometry.only(right: 12.w),
            child: Image.asset(IconsPath.search, height: 20.h, width: 20.w),
          ),
          labelText: 'Enter Your Address',
        ),
        SizedBox(height: 16.h),
        title(text: 'Address Line 2 (Optional)', isDark: isDark),
        field(
          controller: controller.controllers['address2']!,
          labelText: 'Apartment, suite, unit, etc. (optional)',
        ),
        SizedBox(height: 16.h),
        text(text: 'City', isDark: isDark),
        SizedBox(height: 8.h),
        field(
          controller: controller.controllers['city']!,
          labelText: 'Select City',
        ),
        SizedBox(height: 20.h),
        text(text: 'State', isDark: isDark),
        SizedBox(height: 8.h),
        field(
          controller: controller.controllers['state']!,
          labelText: 'Select State',
        ),
        SizedBox(height: 20.h),
        text(text: 'Country', isDark: isDark),
        SizedBox(height: 8.h),
        field(
          controller: controller.controllers['country']!,
          labelText: 'Select Country',
        ),
        SizedBox(height: 20.h),
        text(text: 'Zip Code', isDark: isDark),
        SizedBox(height: 8.h),
        field(
          controller: controller.controllers['zip']!,
          labelText: 'Enter Zip Code',
        ),
        SizedBox(height: 16.h),
        text(text: 'Phone', isDark: isDark),
        SizedBox(height: 8.h),
        SizedBox(
          height: 44.h,
          child: CustomPhoneField(
            controller: controller.controllers['phone']!,
            labelText: 'Enter Your Phone Number',
            onChanged: (PhoneNumber phoneNumber) {
              if (controller.countryCode.isEmpty) {
                controller.countryCode.value = phoneNumber.countryCode;
              }
              debugPrint(controller.countryCode.toString());
            },
          ),
        ),
        SizedBox(height: 16.h),
        title(text: 'Address Type', isDark: isDark),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: _buildRadioOption(
                  context: context,
                  title: 'Home',
                  value: 'home',
                  groupValue: controller.addressType.value,
                  onChanged: (value) => controller.addressType.value = value!,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildRadioOption(
                  context: context,
                  title: 'Work',
                  value: 'work',
                  groupValue: controller.addressType.value,
                  onChanged: (value) => controller.addressType.value = value!,
                ),
              ),
            ],
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
        Obx(() {
          return controller.isLoading.value
              ? ButtonLoading()
              : CustomPrimaryButton(
                  text: 'Save',
                  onPressed: () async {
                    await controller.addAddress();
                  },
                );
        }),
      ],
    );
  }

  Widget _buildRadioOption({
    required BuildContext context,
    required String title,
    required String value,
    required String groupValue,
    required Function(String?) onChanged,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : (isDark
                      ? AppColors.darkBorderColor
                      : AppColors.fieldBorderColorLight),
            width: 1.5.r,
          ),
          borderRadius: BorderRadius.circular(8.r),
          color: isSelected
              ? AppColors.primaryColor.withValues(alpha: 0.1)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_on : Icons.radio_button_off,
              color: isSelected
                  ? AppColors.primaryColor
                  : (isDark ? AppColors.whiteColor : AppColors.titleColor),
              size: 20.r,
            ),
            SizedBox(width: 8.w),
            CustomPrimaryText(
              text: title,
              fontSize: 14.sp,
              color: isSelected
                  ? AppColors.primaryColor
                  : (isDark ? AppColors.whiteColor : AppColors.titleColor),
            ),
          ],
        ),
      ),
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

  Widget text({required String text, required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      color: isDark ? AppColors.whiteColor : AppColors.fieldTextColorDark,
      fontSize: 14.sp,
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
