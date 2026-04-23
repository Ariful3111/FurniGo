import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/profile/controllers/add_address_controller.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/add_new_address_dialog_address_type.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/add_new_dialog_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class AddNewAddressDialogFields extends GetWidget<AddAddressController> {
  const AddNewAddressDialogFields({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AddNewDialogHelper addNewDialogHelper = AddNewDialogHelper();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       addNewDialogHelper.title(text: 'Address Label', isDark: isDark),
        addNewDialogHelper.field(
          controller: controller.controllers['label']!,
          labelText: 'e.g., Home, Work, Warehouse..',
        ),
        SizedBox(height: 16.h),
        addNewDialogHelper.title(text: 'Full Name', isDark: isDark),
        addNewDialogHelper.field(
          controller: controller.controllers['name']!,
          labelText: 'Enter Your Name',
        ),
        SizedBox(height: 16.h),
        addNewDialogHelper.title(text: 'Address Line 1', isDark: isDark),
        addNewDialogHelper.field(
          controller: controller.controllers['address1']!,
          suffixIcon: Padding(
            padding: EdgeInsetsGeometry.only(right: 12.w),
            child: Image.asset(IconsPath.search, height: 20.h, width: 20.w),
          ),
          labelText: 'Enter Your Address',
        ),
        SizedBox(height: 16.h),
        addNewDialogHelper.title(text: 'Address Line 2 (Optional)', isDark: isDark),
        addNewDialogHelper.field(
          controller: controller.controllers['address2']!,
          labelText: 'Apartment, suite, unit, etc. (optional)',
        ),
        SizedBox(height: 16.h),
        addNewDialogHelper.text(text: 'City', isDark: isDark),
        SizedBox(height: 8.h),
        addNewDialogHelper.field(
          controller: controller.controllers['city']!,
          labelText: 'Select City',
        ),
        SizedBox(height: 20.h),
        addNewDialogHelper.text(text: 'State', isDark: isDark),
        SizedBox(height: 8.h),
        addNewDialogHelper.field(
          controller: controller.controllers['state']!,
          labelText: 'Select State',
        ),
        SizedBox(height: 20.h),
        addNewDialogHelper.text(text: 'Country', isDark: isDark),
        SizedBox(height: 8.h),
        addNewDialogHelper.field(
          controller: controller.controllers['country']!,
          labelText: 'Select Country',
        ),
        SizedBox(height: 20.h),
        addNewDialogHelper.text(text: 'Zip Code', isDark: isDark),
        SizedBox(height: 8.h),
        addNewDialogHelper.field(
          controller: controller.controllers['zip']!,
          labelText: 'Enter Zip Code',
        ),
        SizedBox(height: 16.h),
        addNewDialogHelper.text(text: 'Phone', isDark: isDark),
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
        AddNewAddressDialogAddressType()
      ],
    );
  }
}
