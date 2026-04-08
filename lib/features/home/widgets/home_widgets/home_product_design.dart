import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';

class HomeProductDesign extends StatelessWidget {
  final VoidCallback onFavorite;
  final VoidCallback onCart;
  final String image;
  final int productID;
  final bool isFavorite;
  final bool isCart;

  const HomeProductDesign({
    super.key,
    required this.onFavorite,
    required this.onCart,
    required this.image,
    required this.productID,
    required this.isFavorite,
    required this.isCart,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 200.h,
      width: 196.w,
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkTitleColor : AppColors.fieldColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: button(
              onTap: onFavorite,
              icon: isFavorite ? IconsPath.favoriteFill : IconsPath.favorite,
              isDark: isDark,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: button(
              onTap: onCart,
              icon: IconsPath.homeCart,
              isDark: isDark,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.productDetailsView,
                    arguments: productID,
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: 120.h,
                  width: 136.w,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => ButtonLoading(),
                ),
              ),
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
            color: isDark ? AppColors.whiteColor : AppColors.buttonTextColor,
          ),
        ),
      ),
    );
  }
}
