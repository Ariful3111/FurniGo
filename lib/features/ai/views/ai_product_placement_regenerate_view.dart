import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_regenerate_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_generate_button.dart';
import 'package:zb_dezign/features/ai/widgets/ai_header.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_regenerate_button.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_regenerate/ai_product_placement_regenerate_image.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiProductPlacementRegenerateView
    extends GetView<AiProductPlacementRegenerateController> {
  const AiProductPlacementRegenerateView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: ListView(
        children: [
          AiHeader(),
          SizedBox(height: 24.h),
          SharedContainer(
            padding: EdgeInsets.zero,
            width: MediaQuery.widthOf(context),
            height: 237.h,
            radius: 24.r,
            image: DecorationImage(
              image: AssetImage(ImagesPath.product),
              fit: BoxFit.cover,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 12.h,
                  right: 12.w,
                  child: AiProductPlacementRegenerateButton(),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
         Obx(()=> AnimatedSize(
            duration: Duration(milliseconds: 300),
            child: controller.isRegenerate.value
                ? AiProductPlacementRegenerateImage()
                : SizedBox(),
          )),
          SizedBox(height: 12.h),
          AiGenerateButton(
            onTap: () {
              controller.isRegenerate.value = true;
            },
            title: 'Regenerate',
          ),
        ],
      ),
    );
  }
}
