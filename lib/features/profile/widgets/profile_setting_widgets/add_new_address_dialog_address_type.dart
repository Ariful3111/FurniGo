import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/profile/controllers/add_address_controller.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/add_new_dialog_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AddNewAddressDialogAddressType extends GetWidget<AddAddressController> {
  const AddNewAddressDialogAddressType({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AddNewDialogHelper addNewDialogHelper = AddNewDialogHelper();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addNewDialogHelper.title(text: 'Address Type', isDark: isDark),
        Obx(
          () => Row(
            children: [
              Expanded(
                child: addNewDialogHelper.buildRadioOption(
                  context: context,
                  title: 'Home',
                  value: 'home',
                  groupValue: controller.addressType.value,
                  onChanged: (value) => controller.addressType.value = value!,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: addNewDialogHelper.buildRadioOption(
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
}
