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
            width: 72.w,
            height: 72.h,
            decoration: BoxDecoration(
              color: isDark ? AppColors.labelColor : AppColors.whiteColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: 60.w,
                height: 60.h,
                padding: EdgeInsets.all(14.r),
                decoration: ShapeDecoration(
                  gradient: isDark
                      ? AppColors.darkPrimaryGradient
                      : LinearGradient(
                          begin: Alignment(-0.10, 0.83),
                          end: Alignment(1.66, -0.19),
                          colors: [Color(0xFF15003A), Color(0xFF3900A0)],
                        ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
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
