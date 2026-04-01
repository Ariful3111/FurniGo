import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/utils/image_picker.dart';
import 'package:zb_dezign/features/rent_request/models/floor_plan_model.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_image.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_error_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/property_details_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class OfficeFloor extends StatelessWidget {
  final FloorPlanItem item;
  const OfficeFloor({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myField(
          text: 'Length',
          controller: item.lengthController,
          labelText: 'Enter Length',
        ),
        SizedBox(height: 10.h),
        myField(
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
          return Container(
            height: 210.h,
            width: MediaQuery.widthOf(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(width: 1.2.r, color: const Color(0xFFD1D5DC)),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.file(
                      File(item.imagePath.value),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: GestureDetector(
                    onTap: () {
                      item.imagePath.value = '';
                    },
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withValues(alpha: 0.6),
                      ),
                      child: Icon(Icons.close, size: 16.r, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
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
