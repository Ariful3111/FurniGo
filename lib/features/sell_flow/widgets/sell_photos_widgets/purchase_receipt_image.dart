import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_photos_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class PurchaseReceiptImage extends GetWidget<SellFlowPhotosController> {
  const PurchaseReceiptImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedContainer(
      border: Border.all(width: 1, color: AppColors.grayBorderColor),
      radius: 16.r,
      padding: EdgeInsets.symmetric(vertical: 37.h, horizontal: 12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IconsPath.download, height: 32.h,width: 32.w, color: AppColors.greyColor),
          SizedBox(height: 20.h),
          CustomPrimaryText(
            text: 'Upload your receipts here, or click to browse',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          CustomPrimaryText(
            text: 'PDF, JPG, PNG up to 10MB each',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.lightGreyColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SellFlowHelper().buildUploadButton(
                  'Choose from Gallery',
                  () => controller.pickFromGalleryDirectly(),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: SellFlowHelper().buildUploadButton(
                  'Capture Image',
                  () => controller.captureImage(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
