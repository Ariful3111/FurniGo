import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/cylinder_painter.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CylinderBar extends StatelessWidget {
  final String label;
  final int value;
  final double fillRatio;
  final bool isSelected;
  final bool isDark;
  final VoidCallback onTap;

  const CylinderBar({
    super.key,
    required this.label,
    required this.value,
    required this.fillRatio,
    required this.isSelected,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TweenAnimationBuilder gives us a smooth 0→1 / 1→0 float whenever
    // [isSelected] flips. The painter uses this float to interpolate colors.
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: isSelected ? 1.0 : 0.0),
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeInOut,
      builder: (context, animValue, _) {
        return GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 33.7.w,
                    height: 109.76.h,
                    child: CustomPaint(
                      painter: CylinderPainter(
                        fillRatio: fillRatio,
                        animValue: animValue,
                        isDark: isDark,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CustomPrimaryText(
                      text: '$value',
                      fontSize: 8,
                      color: isDark
                          ? AppColors.primaryBorderColor
                          : AppColors.labelColor,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              CustomPrimaryText(
                text: label,
                fontSize: 8,
                color: isDark
                    ? AppColors.whiteBorderColor
                    : isSelected
                    ? AppColors.primaryColor
                    : AppColors.greyTextColor,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
