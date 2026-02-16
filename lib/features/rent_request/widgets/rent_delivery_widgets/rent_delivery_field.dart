import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_delivery_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_phone_field.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentDeliveryField extends StatelessWidget {
  const RentDeliveryField({super.key});

  @override
  Widget build(BuildContext context) {
    RentDeliveryController rentDeliveryController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(text: 'First name *'),
        SizedBox(height: 16.h),
        CustomTextFormField(
          controller: rentDeliveryController.firstNameController,
          labelText: 'Enter first name',
        ),
        SizedBox(height: 26.h),
        text(text: 'Last name *'),
        SizedBox(height: 16.h),
        CustomTextFormField(
          controller: rentDeliveryController.lastNameController,
          labelText: 'Enter last name',
        ),
        SizedBox(height: 26.h),
        text(text: 'Address'),
        SizedBox(height: 16.h),
        CustomTextFormField(
          controller: rentDeliveryController.deliveryAddressController,
          labelText: 'Enter delivery address',
        ),
        SizedBox(height: 26.h),
        text(text: 'City'),
        SizedBox(height: 8.h),
        CustomDropdownMenu(
          onSelect: (value) {
            rentDeliveryController.selectedCity.value = value!;
          },
          option: rentDeliveryController.city,
          isSelect: rentDeliveryController.selectedCity,
          label: rentDeliveryController.selectedCity.value,
          labelColor: AppColors.fieldTextColor,
          selectedTrailingIconColor: AppColors.fieldTextColor,
          trailingIconColor: AppColors.fieldTextColor,
        ),
        SizedBox(height: 26.h),
        text(text: 'State'),
        SizedBox(height: 8.h),
        CustomDropdownMenu(
          onSelect: (value) {
            rentDeliveryController.selectedState.value = value!;
          },
          option: rentDeliveryController.state,
          isSelect: rentDeliveryController.selectedState,
          label: rentDeliveryController.selectedState.value,
          labelColor: AppColors.fieldTextColor,
          selectedTrailingIconColor: AppColors.fieldTextColor,
          trailingIconColor: AppColors.fieldTextColor,
        ),
        SizedBox(height: 26.h),
        text(text: 'Zip code'),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: rentDeliveryController.zipController,
          labelText: 'Enter Zip code',
        ),
        SizedBox(height: 26.h),
        text(text: 'Phone'),
        SizedBox(height: 8.h),
        CustomPhoneField(
          controller: rentDeliveryController.numberDateController,
          labelText: 'Enter Your Phone Number',
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Obx(
              () => CustomCheckBox(
                isChecked: rentDeliveryController.isChecked.value,
                onChange: (value) {
                  rentDeliveryController.isChecked.value = value;
                },
              ),
            ),
            text(
              text: 'Save This Information For Next Time',
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ],
    );
  }

  Widget text({required String text, FontWeight? fontWeight}) {
    return CustomPrimaryText(
      text: text,
      fontSize: 14.sp,
      fontWeight: fontWeight,
      color: AppColors.fieldTextColorDark,
    );
  }
}
