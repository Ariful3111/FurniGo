import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/controller/checkout_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_phone_field.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CheckoutForm extends GetWidget<CheckoutController> {
  const CheckoutForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildField(
          title: 'First Name',
          hint: 'Enter First Name',
          controller: controller.firstName,
        ),
        SizedBox(height: 12.h),
        _buildField(
          title: 'Last Name',
          hint: 'Enter Last Name',
          controller: controller.lastName,
        ),
        SizedBox(height: 12.h),
        _buildField(
          title: 'Address',
          hint: 'Enter Delivery Address',
          controller: controller.address,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildField(
                title: 'City',
                hint: 'Enter City',
                controller: controller.city,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildField(
                title: 'State',
                hint: 'Enter State',
                controller: controller.state,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        _buildField(
          title: 'Zip Code',
          hint: 'Enter Zip Code',
          controller: controller.zip,
        ),
        SizedBox(height: 12.h),
         CustomPrimaryText(
          text: 'Phone',
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 6.h),
        CustomPhoneField(
          controller: controller.phone, labelText: 'Phone',
        ),
        SizedBox(height: 12.h),
        Obx(
          () => Row(
            children: [
              CustomCheckBox(
                isChecked: controller.saveInfo.value,
                onChange: (value) {
                  controller.saveInfo.value = value ?? false;
                },
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: CustomPrimaryText(
                  text: 'Save This Information For Next Time',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildField({
    required String title,
    required String hint,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 16.sp,
          color: AppColors.fieldTextColorDark,
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          controller: controller,
          labelText: hint,
          borderColor: AppColors.grayBorderColor,
        ),
      ],
    );
  }
}
