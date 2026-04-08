import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/favorites/models/favourite_model.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CustomProductDesign extends StatelessWidget {
  final VoidCallback onFavorite;
  final String? icon;
  final Color? color;
  final FavoriteItem? favoriteItem;
  const CustomProductDesign({
    super.key,
    required this.onFavorite,
    this.icon,
    this.color,
    required this.favoriteItem,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 180.h,
      width: 196.w,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkTitleColor : AppColors.fieldColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(
                  AppRoutes.productDetailsView,
                  arguments: favoriteItem?.product.id ?? 0,
                );
              },
              child: CachedNetworkImage(
                imageUrl:
                    favoriteItem?.product.media
                        .firstWhere((media) => media.type == 'image')
                        .url ??
                    '',
                height: 200.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay Elements
          Positioned(
            top: 8.h,
            left: 8.w,
            right: 8.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SharedContainer(
                  padding: EdgeInsets.symmetric(
                    vertical: 6.h,
                    horizontal: 10.w,
                  ),
                  radius: 20.r,
                  child: CustomPrimaryText(
                    text: favoriteItem?.product.isRentable ?? false
                        ? "Rent Product"
                        : "New Arrival",
                    fontSize: 10.sp,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.labelColor,
                  ),
                ),
                button(
                  onTap: onFavorite,
                  icon: icon ?? IconsPath.favorite,
                  isDark: isDark,
                  color: color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget button({
    required VoidCallback onTap,
    required String icon,
    required bool isDark,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28.h,
        width: 28.w,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Image.asset(
            icon,
            height: 16.h,
            width: 16.w,
            color:
                color ??
                (isDark ? AppColors.whiteColor : AppColors.buttonTextColor),
          ),
        ),
      ),
    );
  }
}
