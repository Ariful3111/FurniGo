import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPaymentDropdownItem {
  List<DropdownMenuEntry<String>> dropdownMenuItem({
    required List<String> cardList,
    required RxString selectedCard,
    required BuildContext context,
    required String brandIconPath,
    double? menuFontSize,
    EdgeInsets? entryPadding,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return cardList.map((card) {
      return DropdownMenuEntry<String>(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isDark ? AppColors.labelColor : AppColors.whiteColor,
          ),
        ),
        value: card,
        label: card,
        labelWidget: _paymentEntry(
          context: context,
          card: card,
          selectedCard: selectedCard,
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
    required RxString selectedCard,
    double? menuFontSize,
    EdgeInsets? padding,
    required String brandIconPath,
  }) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(() {
      final bool selected = card == selectedCard.value;
      return Container(
        padding:
            padding ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: selected
              ? (isDark
                    ?  Color.fromARGB(255, 87, 90, 95)
                    :  Color(0xFFF6F6F6))
              : null,
        ),
        child: Row(
          children: [
            Image.asset(brandIconPath, height: 18.h, width: 28.w),
            SizedBox(width: 10.w),
            CustomPrimaryText(
              text: card,
              fontSize: menuFontSize ?? 14.sp,
              color: isDark ? AppColors.whiteColor : AppColors.darkColor,
            ),
            Spacer(),
            CustomRadioButton<String>(
              value: card,
              groupValue: selectedCard.value,
              onChange: (val) {
                if (val != null) {
                  selectedCard.value = val;
                }
              },
            ),
          ],
        ),
      );
    });
  }
}
