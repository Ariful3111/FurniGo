import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_delivery_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_phone_field.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomePickAddress extends GetView<SellFlowDeliveryController> {
  const HomePickAddress({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Pickup Address',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: field(
                controller: controller.firstNameController,
                labelText: 'Enter First Name',
                text: 'First Name',
                isDark: isDark,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: field(
                controller: controller.firstNameController,
                labelText: 'Enter Last Name',
                text: 'Last Name',
                isDark: isDark,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        field(
          isDark: isDark,
          controller: controller.addressController,
          labelText: 'Enter Delivery Address',
          text: 'Address',
          suffixIcon: Padding(
            padding: EdgeInsetsGeometry.only(right: 16.w),
            child: Image.asset(IconsPath.search, height: 20.h, width: 20.w),
          ),
        ),
        SizedBox(height: 16.h),
        field(
          controller: controller.cityController,
          labelText: 'Select',
          text: 'City',
          isDark: isDark,
        ),
        SizedBox(height: 16.h),
        field(
          controller: controller.stateController,
          labelText: 'Select',
          text: 'State',
          isDark: isDark,
        ),
        SizedBox(height: 16.h),
        field(
          controller: controller.zipController,
          labelText: 'Enter Zip Code',
          text: 'Zip Code',
          isDark: isDark,
        ),
        SizedBox(height: 16.h),
        CustomPrimaryText(
          text: 'Phone',
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.fieldTextColorDark,
        ),
        SizedBox(height: 8.h),
        CustomPhoneField(
          controller: controller.phoneController,
          labelText: 'Enter Your Phone Number',
        ),
        SizedBox(height: 16.h),
        Obx(
          () => Row(
            children: [
              CustomCheckBox(
                isChecked: controller.isSaveInfo.value,
                onChange: (value) {
                  controller.isSaveInfo.value = value;
                },
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: CustomPrimaryText(
                  text: 'Save This Information For Next Time',
                  fontSize: 14.sp,
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.fieldTextColorDark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget field({
    required TextEditingController controller,
    required String labelText,
    required String text,
    required bool isDark,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: text,
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.fieldTextColorDark,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller,
          labelText: labelText,
          labelFontSize: 14.sp,
          labelFontWeight: FontWeight.w400,
          suffixIcon: suffixIcon,
        ),
      ],
    );
  }
}
