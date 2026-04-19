import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/home/controller/bottom_nav_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class BottomNavItems extends GetWidget<BottomNavController> {
  final String icon;
  final String label;
  final int index;
  const BottomNavItems({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: () => controller.selectedIndex.value = index,
      child: SizedBox(
        height: MediaQuery.widthOf(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 24.h,
              width: 24.w,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : controller.selectedIndex.value == index
                  ? AppColors.secondaryColor
                  : AppColors.labelColor,
            ),
            SizedBox(height: 4.h),
            CustomPrimaryText(
              text: label,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : controller.selectedIndex.value == index
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
