import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/month_dropdown/custom_month_dropdown_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/month_dropdown/custom_month_dropdown_menu.dart';

class CustomMonthDropdownOverlay
    extends GetWidget<CustomMonthDropdownController> {
  const CustomMonthDropdownOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.closeDropdown,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: [
          const SizedBox.expand(),
          CompositedTransformFollower(
            link: controller.layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, 36.h),
            child: Align(
              alignment: Alignment.topLeft,
              child: CustomMonthDropdownMenu(),
            ),
          ),
        ],
      ),
    );
  }
}
