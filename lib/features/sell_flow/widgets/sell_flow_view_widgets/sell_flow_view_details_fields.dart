import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_view_widgets/sell_flow_view_dropdown.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SellFlowViewDetailsFields extends StatelessWidget {
  final ItemFormModel item;

  const SellFlowViewDetailsFields({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(text: "Item category *", isDark: isDark),
        SizedBox(height: 8.h),
        SellFlowViewDropdown(item: item,),
        SizedBox(height: 12.h),
        title(text: "Brand", isDark: isDark),
        SizedBox(height: 8.h),
        field(
          controller: item.brandController,
          labelText: "e.g., IKEA, Freedom, Custom",
        ),
        SizedBox(height: 12.h),
        title(text: "Dimensions", isDark: isDark),
        SizedBox(height: 8.h),
        field(
          controller: item.dimensionController,
          labelText: "e.g., 200cm x 90cm x 80cm (L x W x H)",
        ),
        SizedBox(height: 6.h),
        title(
          text: "Add length x width x height for a more accurate quote.",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
          isDark: isDark,
        ),
        SizedBox(height: 12.h),
        title(text: "Age (if known)", isDark: isDark),
        SizedBox(height: 8.h),
        field(controller: item.ageController, labelText: "e.g., 2 years"),
        SizedBox(height: 6.h),
        title(
          text: "If you're not sure, leave it blank.",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
          isDark: isDark,
        ),
        SizedBox(height: 12.h),
        title(text: "Condition notes *", isDark: isDark),
        SizedBox(height: 8.h),
        field(
          controller: item.conditionController,
          labelText:
              "Describe any scratches, stains, missing parts, repairs...",
          maxLines: 3,
          fillColor:isDark? AppColors.labelColor:Color(0xFFF1F1F1),
          labelColor: Color(0xFF6B7280),
          isAlignLabelWithHint: true,
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget title({
    required String text,
    required bool isDark,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return CustomPrimaryText(
      text: text,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? (isDark ? AppColors.whiteColor : AppColors.darkTextColor),
    );
  }

  Widget field({
    required TextEditingController controller,
    required String labelText,
    int? maxLines,
    Color? fillColor,
    Color? labelColor,
    bool? isAlignLabelWithHint,
  }) {
    return CustomTextFormField(
      controller: controller,
      labelText: labelText,
      labelColor: labelColor ?? Color(0xFF99A1AF),
      labelFontSize: 14.sp,
      labelFontWeight: FontWeight.w400,
      maxLines: maxLines,
      fillColor: fillColor,
      isAlignLabelWithHint: isAlignLabelWithHint,
    );
  }
}
