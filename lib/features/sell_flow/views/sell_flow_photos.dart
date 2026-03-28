import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_photos_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_helper.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_photos_widgets/proof_of_purchase.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_photos_widgets/sell_flow_photo_upload.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SellFlowPhotos extends GetWidget<SellFlowPhotosController> {
  const SellFlowPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrimaryText(
                    text: "Product: Chair",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  Obx(
                    () => InkWell(
                      onTap: () => controller.isProductPhotosExpanded.toggle(),
                      child: AnimatedRotation(
                        turns: controller.isProductPhotosExpanded.value
                            ? 0.5
                            : 0,
                        duration: Duration(milliseconds: 300),
                        child: Image.asset(
                          IconsPath.downArrow,
                          width: 20.w,
                          height: 20.h,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SellFlowPhotoUpload(),
            ],
          ),
        ),
        SizedBox(height: 16),
        Obx(
          () => controller.allPhotosUploaded()
              ? SellFlowHelper().buildSuccessBox()
              : SellFlowHelper().warningBox(
                  title: "All 6 photos required",
                  subtitle: "You must upload all 6 photos before proceeding.",
                ),
        ),
        SizedBox(height: 20.h),
        ProofOfPurchase(),
      ],
    );
  }
}
