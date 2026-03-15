import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/theme/theme_controller.dart';

class ThemeModeSwitchButton extends GetWidget<ThemeController> {
  const ThemeModeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isDark = controller.isDarkMode.value;
      return GestureDetector(
        onTap: () {
          controller.changeTheme(!isDark);
        },
        child: SizedBox(
          width: 44.44.w,
          height: 20.h,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage(
                      isDark ? IconsPath.themeDark : IconsPath.themeLight,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              AnimatedAlign(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                alignment: isDark
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                  width: 15.56.w,
                  height: 15.56.h,
                  margin: EdgeInsets.all(2.22.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
