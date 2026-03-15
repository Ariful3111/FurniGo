import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/custom_payment_dropdown/custom_payment_dropdown_item.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/dropdown_input_decoration.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPaymentDropdownMenu extends StatelessWidget {
  final List<String> cardList;
  final RxString selectedCard;
  final void Function(String? value) onSelect;
  final String? hintText;
  final String? label;
  final Color? fillColor;
  final Color? textColor;
  final Color? labelColor;
  final double? height;
  final double? width;
  final EdgeInsets? contentPadding;
  final EdgeInsets? entryPadding;
  final double? fontSize;
  final double? menuFontSize;
  final double? borderWidth;
  final double? focusBorderWidth;
  final double? borderRadius;
  final double? focusBorderRadius;
  final InputBorder? enableBorder;
  final InputBorder? focusBorder;
  final Offset? offset;
  final double? trailingIconHeight;
  final double? trailingIconWidth;
  final Color? trailingIconColor;
  final double? selectedTrailingIconHeight;
  final double? selectedTrailingIconWidth;
  final Color? selectedTrailingIconColor;
  final String brandIconPath;

  const CustomPaymentDropdownMenu({
    super.key,
    required this.cardList,
    required this.selectedCard,
    required this.onSelect,
    this.hintText,
    this.label,
    this.fillColor,
    this.textColor,
    this.labelColor,
    this.height,
    this.width,
    this.contentPadding,
    this.entryPadding,
    this.fontSize,
    this.menuFontSize,
    this.borderWidth,
    this.focusBorderWidth,
    this.borderRadius,
    this.focusBorderRadius,
    this.enableBorder,
    this.focusBorder,
    this.offset,
    this.trailingIconHeight,
    this.trailingIconWidth,
    this.trailingIconColor,
    this.selectedTrailingIconHeight,
    this.selectedTrailingIconWidth,
    this.selectedTrailingIconColor,
    this.brandIconPath = IconsPath.visa,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(
      () => SizedBox(
        height: height,
        width: width ?? MediaQuery.widthOf(context),
        child: DropdownMenu<String>(
          initialSelection: selectedCard.value.isEmpty
              ? null
              : selectedCard.value,
          onSelected: onSelect,
          hintText: hintText,
          textStyle: GoogleFonts.montserrat(
            fontSize: fontSize ?? 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark
                ? AppColors.whiteColor
                : (textColor ?? AppColors.darkTextColor),
          ),
          label: label == null
              ? null
              : CustomPrimaryText(
                  text: label!,
                  fontSize: 14.sp,
                  color: labelColor ?? AppColors.labelColor,
                ),
          inputDecorationTheme: DropdownInputDecoration().inputDecoration(
            context: context,
            fillColor: fillColor,
            enableBorder: enableBorder,
            focusBorder: focusBorder,
            focusBorderWidth: focusBorderWidth,
            borderWidth: borderWidth,
            borderRadius: borderRadius,
            focusBorderRadius: focusBorderRadius,
            contentPadding:
                contentPadding ??
                EdgeInsets.all(12.r),
          ),
          leadingIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Image.asset(
              brandIconPath,
              height: 20.h,
              width: 32.w,
              fit: BoxFit.contain,
            ),
          ),
          trailingIcon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: (trailingIconHeight ?? 24.h),
            color:
                trailingIconColor ??
                (isDark ? AppColors.primaryBorderColor : AppColors.labelColor),
          ),
          selectedTrailingIcon: Icon(
            Icons.keyboard_arrow_up_rounded,
            size: (selectedTrailingIconHeight ?? 24.h),
            color:
                selectedTrailingIconColor ??
                (isDark ? AppColors.primaryBorderColor : AppColors.labelColor),
          ),
          alignmentOffset: offset ?? const Offset(0, 0),
          width: MediaQuery.widthOf(context),
          menuStyle: MenuStyle(
            maximumSize: WidgetStatePropertyAll(
              Size(320.w, MediaQuery.heightOf(context)),
            ),
            backgroundColor: WidgetStatePropertyAll(
              isDark ? AppColors.labelColor : AppColors.whiteColor,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
            ),
            shadowColor: WidgetStatePropertyAll(
              AppColors.shadowColor.withValues(alpha: 0.1),
            ),
          ),
          dropdownMenuEntries: CustomPaymentDropdownItem().dropdownMenuItem(
            cardList: cardList,
            isSelect: selectedCard,
            context: context,
            brandIconPath: brandIconPath,
            menuFontSize: menuFontSize,
            entryPadding: entryPadding
          ),
        ),
      ),
    );
  }
}
