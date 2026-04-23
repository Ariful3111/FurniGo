import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomMonthDropdownItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isLast;
  final bool isDark;
  final VoidCallback onTap;

  const CustomMonthDropdownItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.isLast,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark
                    ? AppColors.primaryColor.withValues(alpha: 0.15)
                    : AppColors.primaryColor.withValues(alpha: 0.08))
              : Colors.transparent,
          border: isLast
              ? null
              : Border(
                  bottom: BorderSide(
                    color: isDark
                        ? AppColors.darkBorderColor
                        : AppColors.primaryBorderColor,
                    width: 0.5,
                  ),
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomPrimaryText(
              text: label,
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected
                  ? (isDark ? AppColors.whiteColor : AppColors.primaryColor)
                  : (isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.labelColor),
            ),
            if (isSelected)
              Icon(
                Icons.check_rounded,
                size: 14.sp,
                color: isDark ? AppColors.whiteColor : AppColors.primaryColor,
              ),
          ],
        ),
      ),
    );
  }
}
