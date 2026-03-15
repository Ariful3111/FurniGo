import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_additional_note_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/property_details_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentAdditionalNoteView extends StatelessWidget {
  const RentAdditionalNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    RentAdditionalNoteController rentAdditionalNoteController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Additional Notes',
          fontWeight: FontWeight.w600,
          color: AppColors.darkColor,
        ),
        SizedBox(height: 26.h),
        myField(
          text: 'Custom notes or special requests',
          controller: rentAdditionalNoteController.noteController,
          labelText: 'Enter Your Note',
        ),
        SizedBox(height: 26.h),
        myField(
          text: 'Brand or material preferences',
          controller: rentAdditionalNoteController.brandController,
          labelText: 'Enter Your Preferences',
        ),
      ],
    );
  }
}
