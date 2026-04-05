import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_details_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_type_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class PropertyDetailsField extends GetWidget<RentPropertyDetailsController> {
  const PropertyDetailsField({super.key, });

  @override
  Widget build(BuildContext context) {
    RentPropertyTypeController rentPropertyTypeController = Get.find();
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myField(
          isDark: isDark,
          text: 'Property Address *',
          controller: controller.propertyAddressController,
          labelText: 'Enter Property Address',
        ),
        SizedBox(height: 16.h),
        myField(
          isDark: isDark,
          text:
              rentPropertyTypeController.selectedPropertyType.value ==
                  'Residential'
              ? 'Property Size *'
              : 'Property Size (Optional)',
          controller: controller.propertySizeController,
          labelText: 'Enter Property Size',
        ),
      ],
    );
  }
}

Widget myField({
  required String text,
  required TextEditingController controller,
  required String labelText,
  required bool isDark,
  String? Function(String?)? validator,
  AutovalidateMode? validation,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomPrimaryText(
        text: text,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: isDark?AppColors.whiteColor: AppColors.darkTextColor,
      ),
      SizedBox(height: 8.h),
      CustomTextFormField(
        controller: controller,
        labelText: labelText,
        fillColor: isDark?AppColors.darkColor: AppColors.whiteColor,
        borderWidth: 1.2.r,
        borderColor:isDark?AppColors.darkBorderColor :AppColors.fieldBorderColorLight,
        validation: validation,
        validator: validator,
      ),
    ],
  );
}
