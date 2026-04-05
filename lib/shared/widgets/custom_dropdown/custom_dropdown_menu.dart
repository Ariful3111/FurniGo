import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/dropdown_input_decoration.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/dropdown_menu_item.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List option;
  final void Function(String? value) onSelect;
  final RxString isSelect;
  final String label;
  final Color? selectedTrailingIconColor;
  final Color? trailingIconColor;
  final Offset? offset;
  final double? borderWidth;
  final double? focusBorderWidth;
  final double? borderRadius;
  final double? focusBorderRadius;
  final EdgeInsets? expandedInsets;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final double? fontSize;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? textColor;
  final Color? labelColor;
  final InputBorder? enableBorder;
  final InputBorder? focusBorder;
  final double? selectedTrailingIconHeight;
  final double? selectedTrailingIconWidth;
  final double? trailingIconHeight;
  final double? trailingIconWidth;
  final double? menuFontSize;
  final AlignmentGeometry? alignmentGeometry;
  const CustomDropdownMenu({
    super.key,
    required this.onSelect,
    required this.option,
    required this.isSelect,
    required this.label,
    this.selectedTrailingIconColor,
    this.trailingIconColor,
    this.offset,
    this.borderWidth,
    this.focusBorderWidth,
    this.expandedInsets,
    this.borderRadius,
    this.focusBorderRadius,
    this.contentPadding,
    this.textAlign,
    this.fontSize,
    this.enableBorder,
    this.focusBorder,
    this.textStyle,
    this.fillColor,
    this.selectedTrailingIconHeight,
    this.selectedTrailingIconWidth,
    this.trailingIconHeight,
    this.trailingIconWidth,
    this.menuFontSize,
    this.alignmentGeometry,
    this.textColor,
    this.labelColor,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => SizedBox(
        height: height,
        width: width ?? MediaQuery.widthOf(context),
        child: DropdownMenu<String>(
          initialSelection: isSelect.value,
          textAlign: textAlign ?? TextAlign.left,
          textStyle:
              textStyle ??
              GoogleFonts.montserrat(
                fontSize: fontSize ?? 14.sp,
                fontWeight: FontWeight.w500,
                color: isDark
                    ? textColor ?? AppColors.whiteColor
                    : textColor ?? AppColors.labelColor,
              ),
          label: CustomPrimaryText(
            text: label,
            fontSize: 14.sp,
            color: isDark
                ? labelColor ?? AppColors.whiteColor
                : labelColor ?? AppColors.labelColor,
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
            contentPadding: contentPadding,
          ),
          expandedInsets: expandedInsets,
          trailingIcon: Image.asset(
            IconsPath.downArrow,
            height: trailingIconHeight ?? 24.h,
            width: trailingIconWidth ?? 24.w,
            color:isDark? trailingIconColor??AppColors.primaryBorderColor:null,
          ),
          selectedTrailingIcon: Image.asset(
            IconsPath.upArrow,
            height: selectedTrailingIconHeight ?? 24.h,
            width: selectedTrailingIconWidth ?? 24.w,
            color:isDark? selectedTrailingIconColor??AppColors.primaryBorderColor:Color(0xFF6B7280),
          ),
          width: MediaQuery.widthOf(context),
          menuStyle: MenuStyle(
            maximumSize: WidgetStatePropertyAll(
              Size(320.w, MediaQuery.heightOf(context)),
            ),
            backgroundColor: WidgetStateProperty.all(
              isDark ? AppColors.darkColor : AppColors.whiteColor,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
            ),
            shadowColor: WidgetStatePropertyAll(
              AppColors.shadowColor.withValues(alpha: 0.1),
            ),
          ),
          alignmentOffset: offset ?? Offset(20, 0),
          onSelected: onSelect,
          dropdownMenuEntries: DropdownMenuItems().dropdownMenuItem(
            option: option,
            context: context,
            isSelect: isSelect,
          ),
        ),
      ),
    );
  }
}
