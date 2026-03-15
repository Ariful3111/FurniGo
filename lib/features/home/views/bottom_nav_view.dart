import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/home/controller/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body:
            controller.pages[controller.selectedIndex.value],
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(25.r),
          
          child: ConvexAppBar(
            backgroundColor: AppColors.whiteColor,
            style: TabStyle.fixedCircle,
            height: 66.h,
            cornerRadius: 24.r,
            color: AppColors.labelColor,
            activeColor: AppColors.labelColor,
            items: [
              TabItem(
                icon: Image.asset(
                  IconsPath.home,
                  height: 24.h,
                  width: 24.w,
                  color: AppColors.labelColor,
                ),
                title: 'Home',
              ),
              TabItem(
                icon: Image.asset(
                  IconsPath.categoryNav,
                  height: 24.h,
                  width: 24.w,
                  color: AppColors.labelColor,
                ),
                title: 'Category',
              ),
              TabItem(
                icon: Container(
                  height: 52.h,
                  width: 52.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    gradient: AppColors.primaryGradient,
                  ),
                  child: Center(
                    child: Image.asset(
                      IconsPath.dashboardNav,
                      height: 24.h,
                      width: 24.w,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                title: 'Dashboard',
              ),
              TabItem(
                icon: Image.asset(
                  IconsPath.cart,
                  height: 24.h,
                  width: 24.w,
                  color: AppColors.labelColor,
                ),
                title: 'Cart',
              ),
              TabItem(
                icon: Image.asset(
                  IconsPath.profileNav,
                  height: 24.h,
                  width: 24.w,
                  color: AppColors.labelColor,
                ),
                title: 'Profile',
              ),
            ],
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}
