import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_scrollbar.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiProductPlacementShopItems
    extends GetWidget<AiProductPlacementController> {
  const AiProductPlacementShopItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedContainer(
      padding: EdgeInsets.all(16.w),
      color: AppColors.whiteColor,
      radius: 22.r,
      child: SizedBox(
        height: 366.h,
        child: CustomScrollbar(
          scrollController: controller.shopScrollController,
          child: Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GridView.builder(
              controller: controller.shopScrollController,
              itemCount: controller.shopItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return Obx(() {
                  final isSelected = controller.shopSelectedItems.contains(index);
                  return GestureDetector(
                    onTap: () => controller.shopToggleItem(index),
                    child: SharedContainer(
                      color: isSelected
                          ? AppColors.primaryColor
                          : AppColors.fieldColor,
                      radius: 10.r,
                      child: Center(
                        child: Image.asset(
                          ImagesPath.chair,
                          width: 43.w,
                          height: 40.h,
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
