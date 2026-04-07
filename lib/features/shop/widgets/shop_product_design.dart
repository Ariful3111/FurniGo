import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ShopProductDesign extends StatelessWidget {
  final VoidCallback onFavorite;
  const ShopProductDesign({
    super.key,
    required this.onFavorite,
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
              icon: IconsPath.favorite,
              isDark: isDark,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SharedContainer(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              radius: 20.r,
              child: CustomPrimaryText(
                text: 'New Arrival',
                fontSize: 12.sp,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.labelColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.productDetailsView);
                },
                child: Image.asset(
                  ImagesPath.chair,
                  height: 120.h,
                  width: 136.w,
                  fit: BoxFit.fill,
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
