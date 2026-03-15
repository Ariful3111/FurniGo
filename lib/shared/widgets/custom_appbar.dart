import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/shared/widgets/action_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppbar extends StatelessWidget {
  final String title;
  final String? icon;
  final VoidCallback onDrawerTap;
  final bool isIcon;
  const CustomAppbar({
    super.key,
    required this.title,
    required this.onDrawerTap,
    this.icon,
    this.isIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        InkWell(
          onTap: onDrawerTap,
          child:isIcon?Image.asset(
            icon ?? IconsPath.drawer,
            height: 24.h,
            width: 24.w,
            color: isDark ? AppColors.whiteColor : null,
          ):SizedBox.shrink(),
        ),
        SizedBox(width: 8.w),
        CustomPrimaryText(
          text: title,
          color: isDark ? AppColors.whiteColor : null,
        ),
        Spacer(),
        ActionButton(icon: IconsPath.favorite, onTap: () {}),
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
          child: ActionButton(
            icon: IconsPath.notification,
            onTap: () {
              Get.toNamed(AppRoutes.notificationView);
            },
          ),
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
