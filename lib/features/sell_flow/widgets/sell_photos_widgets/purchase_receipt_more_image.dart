import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_photos_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';

class PurchaseReceiptMoreImage extends GetWidget<SellFlowPhotosController> {
  const PurchaseReceiptMoreImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.grayBorderColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use Wrap for images to prevent overflow
          Obx(
            () => Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: controller.receiptImages.asMap().entries.map((entry) {
                final index = entry.key;
                final image = entry.value;
                return Stack(
                  children: [
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          image: FileImage(File(image!.path)),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () => controller.removeReceiptImage(index),
                        child: Container(
                          padding: EdgeInsets.all(4.r),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            size: 16.r,
                            color: AppColors.darkColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16.h),
          // Add More button below the images
          Center(
            child: CustomSecondaryButton(
              height: 82.h,
              text: "Add More Receipt",
              icon: IconsPath.plus,
              radius: 12.r,
              onPressed: () => controller.pickReceiptImage(context),
            ),
          ),
        ],
      ),
    );
  }
}
