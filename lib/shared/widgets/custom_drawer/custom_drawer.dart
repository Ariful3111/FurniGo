import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final CustomDrawerController customDrawerController = Get.find();
    final double topPad = MediaQuery.paddingOf(context).top + 8.h;

    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(top: topPad, left: 16.w),
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: 550.h,
            width: 300.w,
            padding:
                EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkColor : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                width: 1.r,
                color: isDark
                    ? AppColors.darkBorderColor
                    : AppColors.borderColor,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(4, 4),
                  blurRadius: 30,
                  color: AppColors.darkColor.withValues(alpha: 0.2),
                ),
              ],
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: List.generate(
                customDrawerController.drawerItem.length,
                (index) {
                  return Obx(() {
                    final bool isSelected =
                        customDrawerController.selectedItem.value == index;
                    final item = customDrawerController.drawerItem[index];

                    return GestureDetector(
                      onTap: () {
                        customDrawerController.selectedItem.value = index;
                        Navigator.pop(context);
                        Get.toNamed(item['page']);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: customDrawerController.drawerItem.length -
                                      1 ==
                                  index
                              ? 0
                              : 8.h,
                        ),
                        height: 48.h,
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          gradient: isSelected
                              ? LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    isDark
                                        ? const Color(0xFFBBA0EB)
                                        : const Color(0xFF15003A),
                                    isDark
                                        ? const Color(0xFFAE45FA)
                                        : const Color(0xFF3A00A0),
                                  ],
                                )
                              : null,
                          boxShadow: isSelected
                              ? [
                                  _shadow(dy: 1,  blur: 3, opacity: 0.10),
                                  _shadow(dy: 5,  blur: 5, opacity: 0.09),
                                  _shadow(dy: 12, blur: 7, opacity: 0.05),
                                  _shadow(dy: 21, blur: 8, opacity: 0.01),
                                  _shadow(dy: 32, blur: 9, opacity: 0.00),
                                ]
                              : null,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              item['icon'] as String,
                              height: 20.h,
                              width: 20.w,
                              color: isSelected
                                  ? AppColors.whiteColor
                                  : isDark
                                      ? AppColors.whiteColor
                                      : AppColors.darkColor,
                            ),
                            SizedBox(width: 12.w),
                            CustomPrimaryText(
                              text: item['title'] as String,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: isSelected
                                  ? AppColors.whiteColor
                                  : isDark
                                      ? AppColors.whiteColor
                                      : AppColors.darkColor,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  BoxShadow _shadow({
    required double dy,
    required double blur,
    required double opacity,
  }) {
    return BoxShadow(
      offset: Offset(0, dy),
      blurRadius: blur,
      color: const Color(0xFF190045).withValues(alpha: opacity),
    );
  }
}