import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_delivery_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_phone_field.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentDeliveryField extends GetWidget<RentDeliveryController> {
  const RentDeliveryField({super.key});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(text: 'First name *', isDark: isDark),
        SizedBox(height: 16.h),
        CustomTextFormField(
          controller: controller.firstNameController,
          labelText: 'Enter first name',
        ),
        SizedBox(height: 26.h),
        text(text: 'Last name *', isDark: isDark),
        SizedBox(height: 16.h),
        CustomTextFormField(
          controller: controller.lastNameController,
          labelText: 'Enter last name',
        ),
        SizedBox(height: 26.h),
        text(text: 'Address', isDark: isDark),
        SizedBox(height: 16.h),
        CustomTextFormField(
          controller: controller.deliveryAddressController,
          labelText: 'Enter delivery address',
        ),
        SizedBox(height: 26.h),
        text(text: 'City', isDark: isDark),
        SizedBox(height: 8.h),
        CustomTextFormField(controller: controller.cityController,labelText: 'Enter City',),
        SizedBox(height: 26.h),
        text(text: 'State', isDark: isDark),
        SizedBox(height: 8.h),
        CustomTextFormField(controller: controller.stateController,labelText: 'Enter State',),
        SizedBox(height: 26.h),
        text(text: 'Zip code', isDark: isDark),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller.zipController,
          labelText: 'Enter Zip code',
        ),
        SizedBox(height: 26.h),
        text(text: 'Phone', isDark: isDark),
        SizedBox(height: 8.h),
        CustomPhoneField(
          controller: controller.numberDateController,
          labelText: 'Enter Your Phone Number',
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Obx(
              () => CustomCheckBox(
                isChecked: controller.isChecked.value,
                onChange: (value) {
                  controller.isChecked.value = value;
                },
              ),
            ),
            text(
              text: 'Save This Information For Next Time',
              fontWeight: FontWeight.w400, isDark: isDark,
            ),
          ],
        ),
      ],
    );
  }

  Widget text({required String text, FontWeight? fontWeight,required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      fontSize: 14.sp,
      fontWeight: fontWeight,
      color: isDark? AppColors.whiteColor: AppColors.fieldTextColorDark,
    );
  }
}
