import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProductDetailsViewImage extends GetWidget<ProductDetailsController> {
  const ProductDetailsViewImage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      child: Row(
        children: [
          button(
            onTap: controller.previous,
            icon: IconsPath.onboardingBack,
            isDark: isDark,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: SizedBox(
              height: 60.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: controller.images.length,
                separatorBuilder: (_,_) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => controller.changeIndex(index),
                    child: SharedContainer(
                      padding: EdgeInsets.zero,
                      width: 60.w,
                      height: 60.h,
                      radius: 12.r,
                      color: isDark ? Color(0xFF161616) : AppColors.fieldColor,
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: Image.asset(
                          controller.images[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 8.w),
          button(
            onTap: controller.next,
            icon: IconsPath.onboardingForward,
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget button({
    required VoidCallback onTap,
    required String icon,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SharedContainer(
        height: 24.h,
        width: 24.w,
        radius: 4.5.r,
        padding: EdgeInsets.zero,
        child: Center(
          child: Image.asset(
            icon,
            height: 15.h,
            width: 15.w,
            color: isDark
                ? AppColors.whiteColor.withValues(alpha: .5)
                : AppColors.darkColor.withValues(alpha: 0.25),
          ),
        ),
      ),
    );
  }
}
