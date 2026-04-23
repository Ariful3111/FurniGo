import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AddNewDialogHelper {
  Widget buildRadioOption({
    required BuildContext context,
    required String title,
    required String value,
    required String groupValue,
    required Function(String?) onChanged,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final isSelected = value == groupValue;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? isDark
                      ? AppColors.whiteColor
                      : AppColors.primaryColor
                : (isDark
                      ? AppColors.darkBorderColor
                      : AppColors.fieldBorderColorLight),
            width: 1.5.r,
          ),
          borderRadius: BorderRadius.circular(8.r),
          color: isSelected
              ? AppColors.primaryColor.withValues(alpha: 0.1)
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_on : Icons.radio_button_off,
              color: isSelected
                  ? isDark
                        ? AppColors.whiteColor
                        : AppColors.primaryColor
                  : (isDark ? AppColors.darkBorderColor : AppColors.titleColor),
              size: 20.r,
            ),
            SizedBox(width: 8.w),
            CustomPrimaryText(
              text: title,
              fontSize: 14.sp,
              color: isSelected
                  ? isDark
                        ? AppColors.whiteColor
                        : AppColors.primaryColor
                  : (isDark ? AppColors.darkBorderColor : AppColors.titleColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget title({required String text, required bool isDark}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomPrimaryText(
        text: text,
        color: isDark ? AppColors.whiteColor : AppColors.fieldTextColorDark,
        fontSize: 14.sp,
      ),
    );
  }

  Widget text({required String text, required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      color: isDark ? AppColors.whiteColor : AppColors.fieldTextColorDark,
      fontSize: 14.sp,
    );
  }

  Widget field({
    required TextEditingController controller,
    required String labelText,
    Widget? suffixIcon,
  }) {
    return SizedBox(
      height: 44.h,
      child: CustomTextFormField(
        controller: controller,
        padding: EdgeInsets.all(4.r),
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelFontSize: 14.sp,
        labelFontWeight: FontWeight.w400,
      ),
    );
  }
}
