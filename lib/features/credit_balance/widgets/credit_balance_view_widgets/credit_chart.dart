import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/credit_balance/controller/credit_balance_controller.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_bar.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CreditChart extends GetWidget<CreditBalanceController> {
  const CreditChart({super.key});

  static const int maxY = 80;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      height: 180.h,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      border: Border.all(
        width: 1.r,
        color: isDark ? AppColors.darkBorderColor : AppColors.primaryBorderColor,
      ),
      radius: 16.r,
      boxShadow: [
        BoxShadow(
          offset: const Offset(1, 4),
          blurRadius: 18.3,
          color: AppColors.darkColor.withValues(alpha: 0.05),
        ),
      ],
      child: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: controller.chartData.asMap().entries.map((entry) {
              final int index = entry.key;
              final item = entry.value;
              final bool isSelected = index == controller.selectedIndex.value;
              final double fillRatio = (item.value ?? 0) / maxY;
              return Padding(
                // Even spacing between cylinders; a bit more on edges
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: CylinderBar(
                  label: item.month ?? '',
                  value: item.value ?? 0,
                  fillRatio: fillRatio,
                  isSelected: isSelected,
                  isDark: isDark,
                  onTap: () => controller.selectIndex(index),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}