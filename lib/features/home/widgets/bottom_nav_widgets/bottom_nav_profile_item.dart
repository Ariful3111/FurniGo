import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/home/controller/bottom_nav_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class BottomNavProfileItem extends GetWidget<BottomNavController> {
  final int index;
  const BottomNavProfileItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
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
