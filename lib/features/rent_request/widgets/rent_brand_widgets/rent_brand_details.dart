import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_brand_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_image.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentBrandDetails extends GetWidget<RentBrandController> {
  const RentBrandDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPrimaryText(
          text: 'Select the branding elements you want to apply:',
          fontSize: 14.sp,
          color: AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        ...List.generate(controller.brand.length, (index) {
          return Obx(
            () => RentHelper().propertyCheckBox(
              context: context,
              isLastIndex: controller.brand.length - 1 == index,
              isChecked: controller.isSelect[index],
              onChange: (value) {
                controller.isSelect[index] = value!;
              },
              title: controller.brand[index],
            ),
          );
        }),
        SizedBox(height: 24.h),
        CustomPrimaryText(
          text: 'Upload Brand Guidelines',
          fontSize: 16.sp,
          color: AppColors.darkColor,
        ),
        SizedBox(height: 16.h),
        PropertyImage(
          title:
              'Upload your brand kit, logo files, or style guide to ensure accurate customization.',
          onGallery: () {},
          onCamera: () {},
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
