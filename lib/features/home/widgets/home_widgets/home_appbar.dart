import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_helper.dart';
import 'package:zb_dezign/features/profile/controllers/profile_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeAppbar extends GetWidget<ProfileController> {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      IconsPath.profileNav,
                      height: 40.h,
                      width: 40.w,
                    ),
                    Positioned(
                      right: -10.w,
                      bottom: -1.5.h,
                      child: Image.asset(
                        IconsPath.silverStar,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPrimaryText(
                      text:
                          controller.userProfile.value?.data?.name ??
                          "User Name",
                      fontSize: 16.sp,
                      color: isDark
                          ? AppColors.darkColor
                          : AppColors.whiteColor,
                      shadow: [HomeHelper.boxShadow()],
                    ),
                    SizedBox(height: 4.h),
                    CustomPrimaryText(
                      text:
                          controller
                              .userProfile
                              .value
                              ?.data
                              ?.type
                              ?.capitalizeFirst ??
                          "Personal",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColors.darkColor
                          : AppColors.whiteColor,
                      shadow: [HomeHelper.boxShadow()],
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {},
                  child: HomeHelper.blurContainer(
                    height: 32.h,
                    width: 32.w,
                    child: Center(
                      child: Image.asset(
                        IconsPath.favorite,
                        height: 16.h,
                        width: 16.w,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                badges.Badge(
                  badgeStyle: badges.BadgeStyle(
                    padding: EdgeInsetsGeometry.all(3.r),
                    badgeGradient: badges.BadgeGradient.linear(
                      begin: Alignment.center,
                      end: Alignment.center,
                      colors: [Color(0xFFEF3929), Color(0xFFEF3929)],
                    ),
                  ),
                  position: badges.BadgePosition.custom(start: 16.w, top: 9.h),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.notificationView);
                    },
                    child: HomeHelper.blurContainer(
                      height: 32.h,
                      width: 32.w,
                      child: Center(
                        child: Image.asset(
                          IconsPath.notification,
                          height: 16.h,
                          width: 16.w,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
    });
  }
}
