import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_floor_plan_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_image.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_error_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/property_details_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class OfficeFloor extends StatelessWidget {
  const OfficeFloor({super.key});

  @override
  Widget build(BuildContext context) {
    RentFloorPlanController rentFloorPlanController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myField(
          text: 'Length',
          controller: rentFloorPlanController.lengthController,
          labelText: 'Enter Length',
        ),
        SizedBox(height: 10.h),
        myField(
          text: 'Width',
          controller: rentFloorPlanController.widthController,
          labelText: 'Enter Length',
        ),
        SizedBox(height: 26.h),
        PropertyImage(
          title: 'Drag & drop your floorplan here, or click to browse',
          onGallery: () {},
          onCamera: () {
            
          },
        ),
        SizedBox(height: 26.h),
        RentErrorContainer(
          text: CustomPrimaryText(
            text:
                'Measurements are approximate  final layout and pricing may vary slightly',
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.errorTextColor,
          ),
        ),
      ],
    );
  }
}
