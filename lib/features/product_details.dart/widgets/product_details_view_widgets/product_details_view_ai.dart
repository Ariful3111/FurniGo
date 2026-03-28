import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProductDetailsViewAi extends GetWidget<ProductDetailsController> {
  const ProductDetailsViewAi({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.isAi.value = !controller.isAi.value;
        },
        child: SharedContainer(
          padding: EdgeInsets.all(2.w),
          radius: 8.r,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFE991FF), Color(0xFF5CB1F7)],
          ),
          child: SharedContainer(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            radius: 8.r,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColors.whiteColor, Color(0xFFE9F5FF)],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkColor.withValues(alpha: 0.1),
                blurRadius: 28,
                offset: Offset(0, 8),
              ),
            ],
            child: AnimatedSize(
              duration: Duration(milliseconds: 300),
              child: controller.isAi.value
                  ? Row(
                      key: ValueKey('Text'),
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomPrimaryText(
                          text: 'Place in AI design',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.labelColor,
                        ),
                        Image.asset(IconsPath.ai, height: 18.h, width: 18.w),
                      ],
                    )
                  : Center(
                      key: ValueKey('Icon'),
                      child: Image.asset(
                        IconsPath.ai,
                        height: 18.h,
                        width: 18.w,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
