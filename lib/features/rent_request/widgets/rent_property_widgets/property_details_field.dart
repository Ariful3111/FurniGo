import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_property_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class PropertyDetailsField extends StatelessWidget {
  const PropertyDetailsField({super.key});

  @override
  Widget build(BuildContext context) {
    RentPropertyDetailsController rentPropertyDetailsController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myField(
          text: 'Property Address *',
          controller: rentPropertyDetailsController.propertyAddressController,
          labelText: 'Enter Property Address',
        ),
        SizedBox(height: 16.h),
        myField(
          text: 'Property Size (Optional)',
          controller: rentPropertyDetailsController.propertySizeController,
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
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomPrimaryText(
        text: text,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextColor,
      ),
      SizedBox(height: 8.h),
      CustomTextFormField(
        controller: controller,
        labelText: labelText,
        fillColor: AppColors.whiteColor,
        borderWidth: 1.2.r,
        borderColor: AppColors.fieldBorderColorLight,
      ),
    ],
  );
}
