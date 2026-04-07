import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class DropdownMenuItems {
  List<DropdownMenuEntry<String>> dropdownMenuItem({
    required List option,
    required RxString isSelect,
    required BuildContext context,
    double? menuFontSize,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return option.map((option) {
      bool selected = option == isSelect.value;
      return DropdownMenuEntry<String>(
        value: option,
        label: option,
        style: ButtonStyle(
          backgroundColor: isDark
              ? WidgetStatePropertyAll(AppColors.darkColor)
              : WidgetStatePropertyAll(AppColors.whiteColor),
        ),
        labelWidget: dropdownItem(
          color: selected ? Color(0xFFF6F6F6) : null,
          option: option,
          textColor: selected
              ? isDark
                    ? AppColors.labelColor
                    : AppColors.labelColor
              : isDark
              ? AppColors.whiteColor
              : AppColors.labelColor,
          fontSize: menuFontSize ?? 14.sp,
        ),
      );
    }).toList();
  }

  Widget dropdownItem({
    Color? color,
    required String option,
    required Color textColor,
    required double fontSize,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: color,
      ),
      child: CustomPrimaryText(
        text: option,
        fontSize: fontSize,
        color: textColor,
      ),
    );
  }
}
