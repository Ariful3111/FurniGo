import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/home/controller/bottom_nav_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer_controller.dart';

class BottomNavDashboardItem extends GetWidget<BottomNavController> {
  const BottomNavDashboardItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        controller.selectedIndex.value = 2;
        Get.find<CustomDrawerController>().selectedItem.value = 0;
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: isDark ? AppColors.labelColor : AppColors.whiteColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: 52.w,
                height: 52.h,
                padding: EdgeInsets.all(14.r),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: isDark
                        ? [Color(0xFFBBA0EB), Color(0xFFAE45FA)]
                        : [AppColors.primaryColor, Color(0xFF3A00A0)],
                    stops: [0, 1],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  shadows: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      color: isDark
                          ? Color(0xFF4B0FF2).withValues(alpha: 0.15)
                          : Color(0xFF5006D0).withValues(alpha: 0.15),
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
    );
  }
}
