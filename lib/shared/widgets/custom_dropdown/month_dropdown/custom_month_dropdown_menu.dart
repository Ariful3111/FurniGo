import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/month_dropdown/custom_month_dropdown_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/month_dropdown/custom_month_dropdown_item.dart';

class CustomMonthDropdownMenu extends GetWidget<CustomMonthDropdownController> {
  const CustomMonthDropdownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 130.w,
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1A1A1A) : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.primaryBorderColor,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: controller.options.asMap().entries.map((entry) {
                final int idx = entry.key;
                final String option = entry.value;
                final bool isSelected =
                    controller.selectedOption.value == option;
                final bool isLast = idx == controller.options.length - 1;

                return CustomMonthDropdownItem(
                  label: option,
                  isSelected: isSelected,
                  isLast: isLast,
                  isDark: isDark,
                  onTap: () => controller.selectOption(option),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
