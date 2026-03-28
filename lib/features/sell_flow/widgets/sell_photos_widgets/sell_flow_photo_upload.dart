import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_photos_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_photos_widgets/sell_flow_photo_add_more.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_photos_widgets/sell_photo_upload.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SellFlowPhotoUpload extends GetWidget<SellFlowPhotosController> {
  const SellFlowPhotoUpload({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> labels = [
      "Top",
      "Bottom",
      "Left",
      "Right",
      "Back",
      "Front",
    ];

    return Obx(
      () => AnimatedSize(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: controller.isProductPhotosExpanded.value
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  CustomPrimaryText(
                    text: "Upload photos (6 required)",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 4),
                  CustomPrimaryText(
                    text: "Recommended: top, bottom, left, right, back, front.",
                    fontSize: 14,
                    color: AppColors.secondaryTextColor,
                  ),
                  SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: labels.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return Obx(
                        () => SellPhotoUpload(
                          title: labels[index],
                          image: controller.images[index],
                          onTap: () =>
                              controller.pickSingleImage(index, context),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  SellFlowPhotoAddMore(),
                ],
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
