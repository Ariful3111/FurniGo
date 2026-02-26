import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class BottomNavItems extends DelegateBuilder {
  @override
  Widget build(BuildContext context, int index, bool isActive) {
    List icon = [
      IconsPath.home,
      IconsPath.categoryNav,
      IconsPath.dashboardNav,
      IconsPath.cart,
      IconsPath.profileNav,
    ];
    return Image.asset(
      icon[index],
      height: 24.h,
      width: 24.w,
      color: isActive ? AppColors.primaryColor : AppColors.labelColor,
    );
  }
}
