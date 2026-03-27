import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_photos_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';

class SellFlowPhotoAddMore extends GetWidget<SellFlowPhotosController> {
  const SellFlowPhotoAddMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: Column(
          children: [
            if (controller.additionalPhotos.isNotEmpty)
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  ...controller.additionalPhotos.asMap().entries.map(
                    (entry) => Stack(
                      children: [
                        Container(
                          width: 80.w,
                          height: 80.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: AppColors.borderColor),
                            image: DecorationImage(
                              image: FileImage(File(entry.value.path)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4.h,
                          right: 4.w,
                          child: GestureDetector(
                            onTap: () =>
                                controller.removeAdditionalPhoto(entry.key),
                            child: Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: AppColors.darkColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                size: 14.r,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            SizedBox(height: 12.h),
            CustomSecondaryButton(
              height: 82.h,
              text: "Add More Photo",
              onPressed: () => controller.pickAdditionalPhoto(context),
              icon: IconsPath.plus,
              radius: 12.r,
            ),
          ],
        ),
      ),
    );
  }
}
