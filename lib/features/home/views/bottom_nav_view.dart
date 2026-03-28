import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/home/controller/bottom_nav_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [controller.pages[controller.selectedIndex.value]],
        ),
        bottomNavigationBar: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.all(25.r),
              width: MediaQuery.widthOf(context),
              height: 66.h,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkColor : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: _buildNavItem(
                      icon: IconsPath.home,
                      label: 'Home',
                      index: 0,
                    ),
                  ),
                  Expanded(
                    child: _buildNavItem(
                      icon: IconsPath.categoryNav,
                      label: 'Category',
                      index: 1,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Expanded(
                    child: _buildNavItemWithBadge(
                      icon: IconsPath.cart,
                      label: 'Cart',
                      index: 3,
                      badgeCount: '4',
                    ),
                  ),
                  Expanded(child: _buildProfileNavItem(index: 4)),
                ],
              ),
            ),
            Positioned(
              bottom: 50.h,
              child: GestureDetector(
                onTap: () {
                  controller.selectedIndex.value = 2;
                  Get.find<CustomDrawerController>().selectedItem.value = 0;
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 72.w,
                      height: 72.h,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: 60.w,
                          height: 60.h,
                          padding: EdgeInsets.all(14.r),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(-0.10, 0.83),
                              end: Alignment(1.66, -0.19),
                              colors: [Color(0xFF15003A), Color(0xFF3900A0)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            shadows: [
                              BoxShadow(
                                color: const Color(0x2600AA5B),
                                blurRadius: 20,
                                offset: const Offset(0, 4),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            IconsPath.dashboardNav,
                            height: 24.h,
                            width: 24.w,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => controller.selectedIndex.value = index,
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 24.h,
              width: 24.w,
              color: controller.selectedIndex.value == index
                  ? AppColors.secondaryColor
                  : AppColors.labelColor,
            ),
            SizedBox(height: 4.h),
            CustomPrimaryText(
              text: label,
              color: controller.selectedIndex.value == index
                  ? AppColors.secondaryColor
                  : AppColors.labelColor,
              fontSize: 12.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItemWithBadge({
    required String icon,
    required String label,
    required int index,
    required String badgeCount,
  }) {
    return GestureDetector(
      onTap: () => controller.selectedIndex.value = index,
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            badges.Badge(
              badgeContent: Text(
                badgeCount,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: AppColors.secondaryColor,
                padding: EdgeInsets.all(4.r),
              ),
              position: badges.BadgePosition.topEnd(top: -7.h, end: -7.w),
              child: Image.asset(
                icon,
                height: 24.h,
                width: 24.w,
                color: controller.selectedIndex.value == index
                    ? AppColors.secondaryColor
                    : AppColors.labelColor,
              ),
            ),
            SizedBox(height: 4.h),
            CustomPrimaryText(
              text: label,
              color: controller.selectedIndex.value == index
                  ? AppColors.secondaryColor
                  : AppColors.labelColor,
              fontSize: 12.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileNavItem({required int index}) {
    return GestureDetector(
      onTap: () => controller.selectedIndex.value = index,
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(IconsPath.profileNav),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            CustomPrimaryText(
              text: 'Profile',
              color: controller.selectedIndex.value == index
                  ? AppColors.secondaryColor
                  : AppColors.labelColor,
              fontSize: 12.sp,
            ),
          ],
        ),
      ),
    );
  }
}
