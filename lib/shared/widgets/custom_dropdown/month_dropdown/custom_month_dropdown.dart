import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/month_dropdown/custom_month_dropdown_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CustomMonthDropdown extends GetView<CustomMonthDropdownController> {
  const CustomMonthDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CustomMonthDropdownController>()) {
      Get.put(CustomMonthDropdownController());
    }
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CompositedTransformTarget(
      link: controller.layerLink,
      child: GestureDetector(
        onTap: () => controller.toggleDropdown(context),
        behavior: HitTestBehavior.opaque,
        child: Obx(
          () => SharedContainer(
            padding: EdgeInsets.symmetric(vertical: 4.18.h, horizontal: 8.35.w),
            radius: 32.67.r,
            color: isDark ? AppColors.darkColor : AppColors.primaryBorderColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    final offsetAnimation = Tween<Offset>(
                      begin: const Offset(0, 0.3),
                      end: Offset.zero,
                    ).animate(animation);

                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      ),
                    );
                  },
                  child: CustomPrimaryText(
                    key: ValueKey(controller.selectedOption.value),
                    text: controller.selectedOption.value,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.labelColor,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(width: 2.w),
                AnimatedRotation(
                  turns: controller.isOpen.value ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 400), // slower
                  curve: Curves.easeOutExpo,
                  child: Image.asset(
                    IconsPath.downArrow,
                    height: 8.53.h,
                    width: 10.96.w,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.labelColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
