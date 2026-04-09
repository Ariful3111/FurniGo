import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_product_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiProductPlacementShopSelectedItems
    extends GetWidget<AiProductPlacementController> {
  const AiProductPlacementShopSelectedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomPrimaryText(
              text: "Selected Item",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            Spacer(),
            GestureDetector(
              onTap: controller.shopScrollLeft,
              child: AiProductPlacementProductHelper().arrowButton(
                Icons.arrow_back_ios,
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: controller.shopScrollRight,
              child: AiProductPlacementProductHelper().arrowButton(
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Obx(() {
          return SizedBox(
            height: 41.h,
            child: ListView.builder(
              controller: controller.shopSelectedScrollController,
              scrollDirection: Axis.horizontal,
              itemCount: controller.shopSelectedItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: SharedContainer(
                    width: 40.w,
                    height: 40.h,
                    radius: 6.r,
                    color: AppColors.fieldColor,
                    image: DecorationImage(image: AssetImage(ImagesPath.chair)),
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
