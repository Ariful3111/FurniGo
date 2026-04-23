import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_view_ai.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProductDetailsViewHeader extends GetWidget<ProductDetailsController> {
  final List<String> images;
  const ProductDetailsViewHeader({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      width: MediaQuery.widthOf(context),
      height: 360.h,
      radius: 16.r,
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: CarouselSlider.builder(
              carouselController: controller.carouselController,
              itemCount: images.length,
              options: CarouselOptions(
                height: 360.h,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  controller.currentIndex.value = index;
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return Center(
                  child: CachedNetworkImage(
                    imageUrl: images[index],
                    width: double.infinity,
                    height: 360.h,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          // Overlay elements on top of carousel
          Positioned(
            left: 20.w,
            top: 50.h,
            child: button(
              onTap: () {
                Navigator.pop(context);
              },
              icon: IconsPath.onboardingBack,
              isDark: isDark,
            ),
          ),
          Positioned(
            right: 20.w,
            top: 50.h,
            child: button(
              onTap: () {},
              icon: IconsPath.favorite,
              isDark: isDark,
            ),
          ),
          Positioned(
            bottom: 16.h,
            left: 0,
            right: 0,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: 8.w,
                    height: 8.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentIndex.value == index
                          ? AppColors.whiteColor
                          : AppColors.fieldBorderColorLight,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(left: 20.w, bottom: 24.h, child: ProductDetailsViewAi()),
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
        height: 32.h,
        width: 32.w,
        radius: 6.r,
        padding: EdgeInsets.zero,
        color: isDark ? AppColors.labelColor : AppColors.whiteColor,
        child: Center(
          child: Image.asset(
            icon,
            height: 20.h,
            width: 20.w,
            color: isDark
                ? AppColors.primaryBorderColor
                : AppColors.darkTitleColor,
          ),
        ),
      ),
    );
  }
}
