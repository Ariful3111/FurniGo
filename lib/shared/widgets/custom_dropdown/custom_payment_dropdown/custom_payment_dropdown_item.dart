import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPaymentDropdownItem {
  List<DropdownMenuEntry<String>> dropdownMenuItem({
    required List<String> cardList,
    required RxString isSelect,
    required BuildContext context,
    required String brandIconPath,
    double? menuFontSize,
    EdgeInsets? entryPadding,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return cardList.map((card) {
      final bool selected = card == isSelect.value;
      return DropdownMenuEntry<String>(
        value: card,
        label: card,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isDark ? AppColors.labelColor : AppColors.whiteColor,
          ),
        ),
        labelWidget: _paymentEntry(
          context: context,
          card: card,
          selected: selected,
          menuFontSize: menuFontSize,
          padding: entryPadding,
          brandIconPath: brandIconPath,
        ),
      );
    }).toList();
  }

  Widget _paymentEntry({
    required BuildContext context,
    required String card,
    required bool selected,
    double? menuFontSize,
    EdgeInsets? padding,
    required String brandIconPath,
  }) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding:
          padding ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: selected
            ? (isDark ? AppColors.darkBorderColor : const Color(0xFFF6F6F6))
            : null,
      ),
      child: Row(
        children: [
          Image.asset(
            brandIconPath,
            height: 18.h,
            width: 28.w,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 10.w),
          CustomPrimaryText(
            text: card,
            fontSize: menuFontSize ?? 14.sp,
            color: isDark ? AppColors.whiteColor : AppColors.darkColor,
          ),
        ],
      ),
    );
  }
}
