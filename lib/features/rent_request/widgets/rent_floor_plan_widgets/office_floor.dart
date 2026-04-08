import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/utils/image_picker.dart';
import 'package:zb_dezign/features/rent_request/models/floor_plan_model.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_image.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_error_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/property_details_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class OfficeFloor extends StatelessWidget {
  final FloorPlanItem item;
  const OfficeFloor({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myField(
          isDark: isDark,
          text: 'Length',
          controller: item.lengthController,
          labelText: 'Enter Length',
        ),
        SizedBox(height: 10.h),
        myField(
          isDark: isDark,
          text: 'Width',
          controller: item.widthController,
          labelText: 'Enter Width',
        ),
        SizedBox(height: 26.h),
        Obx(() {
          if (item.imagePath.value.isEmpty) {
            return PropertyImage(
              title: 'Drag & drop your floorplan here, or click to browse',
              onGallery: () async {
                final path = await ImageManager.pickImageFromGallery();
                if (path != null) {
                  item.imagePath.value = path;
                }
              },
              onCamera: () async {
                final path = await ImageManager.captureImageViaCamera();
                if (path != null) {
                  item.imagePath.value = path;
                }
              },
            );
          }
          return RentHelper().propertyImageView(
            path: item.imagePath.value,
            onRemove: () => item.imagePath.value = '',
            context: context,
          );
        }),
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
