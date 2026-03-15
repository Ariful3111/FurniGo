import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_brand_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_image.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentBrandDetails extends StatelessWidget {
  const RentBrandDetails({super.key});

  @override
  Widget build(BuildContext context) {
    RentBrandController rentBrandController = Get.find();
    return Column(
      children: [
        CustomPrimaryText(
          text: 'Select the branding elements you want to apply:',
          fontSize: 14.sp,
          color: AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        ...List.generate(rentBrandController.brand.length, (index) {
          return Obx(
            () => propertyCheckBox(
              context: context,
              isLastIndex: rentBrandController.brand.length - 1 == index,
              isChecked: rentBrandController.isSelect[index],
              onChange: (value) {
                rentBrandController.isSelect[index] = value!;
              },
              title: rentBrandController.brand[index],
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
