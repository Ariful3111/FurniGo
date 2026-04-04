import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProductFurnitureCustomized extends GetView<ProductDetailsController> {
  const ProductFurnitureCustomized({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => SharedContainer(
        width: MediaQuery.widthOf(context),
        padding: EdgeInsets.all(16.w),
        radius: 12.r,
        color: isDark ? AppColors.darkColor : Color(0xFFF2F0F5),
        child: Wrap(
          spacing: 18.w,
          runSpacing: 12.h,
          children: List.generate(controller.woodColors.length, (index) {
            final item = controller.woodColors[index];
            final isSelected = controller.selectedColor.value == index;
            return GestureDetector(
              onTap: () => controller.selectedColor.value = index,
              child: SizedBox(
                width: 52.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      height: 30.h,
                      width: 30.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                          width: isSelected ? 2 : 1,
                          color: item['color'],
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomPrimaryText(
                      text: item['title'],
                      fontSize: 12.sp,
                      textAlign: TextAlign.center,
                      color: isDark ? AppColors.whiteColor : Color(0xFF2D2D2D),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
