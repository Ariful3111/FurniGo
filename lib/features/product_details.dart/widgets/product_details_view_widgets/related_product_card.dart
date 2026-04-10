import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/home/models/products_model.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RelatedProductCard extends StatelessWidget {
  final Product product;
  final bool isDark;

  const RelatedProductCard({
    super.key,
    required this.product,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SharedContainer(
            color: AppColors.fieldColor,
            radius: 8.r,
            padding: EdgeInsets.zero,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.productDetailsView,
                      arguments: product.id?.toInt() ?? 0,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: CachedNetworkImage(
                      imageUrl:
                          product.media
                              ?.firstWhere((media) => media.type == 'image')
                              .url ??
                          '',
                      height: 170.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return const ButtonLoading();
                      },
                    ),
                  ),
                ),

                Positioned(
                  top: 8.h,
                  left: 8.w,
                  right: 8.w,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppColors.darkColor.withValues(alpha: 0.8)
                                : AppColors.whiteColor.withValues(alpha: 0.9),
                            borderRadius: BorderRadius.circular(48.r),
                          ),
                          child: CustomPrimaryText(
                            text: (product.isRentable ?? false)
                                ? "Rent Product"
                                : "New Arrival",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: isDark
                                ? AppColors.whiteColor
                                : AppColors.darkTextColor,
                          ),
                        ),
                        button(icon: IconsPath.favorite, onTap: () {}),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8.h,
                  right: 8.w,
                  child: IgnorePointer(
                    ignoring: true,
                    child: button(icon: IconsPath.cart, onTap: () {}),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          CustomPrimaryText(
            text: product.name ?? '',
            fontSize: 14.sp,
            textOverflow: TextOverflow.ellipsis,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 4.h),
          CustomPrimaryText(
            text: (product.finalPrice ?? 0).toString(),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.darkColor,
          ),
        ],
      ),
    );
  }

  Widget button({required String icon, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 24.h,
        width: 24.w,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Image.asset(
            icon,
            height: 16.h,
            width: 16.w,
            color: isDark
                ? AppColors.darkPrimaryTextColor
                : AppColors.buttonTextColor,
          ),
        ),
      ),
    );
  }
}
