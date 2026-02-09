import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

Widget optionContainer({required BuildContext context, required Widget child}) {
  return Container(
    padding: EdgeInsets.all(16.r),
    width: MediaQuery.widthOf(context),
    decoration: BoxDecoration(
      color: Color(0xFFF1F1F1),
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: child,
  );
}

Widget propertyDivider() {
  return Divider(color: AppColors.borderColor, thickness: 1);
}

Widget myButton({
  BoxBorder? border,
  required VoidCallback onTap,
  Color? color,
  required Widget child,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: color ?? AppColors.whiteColor,
        borderRadius: BorderRadius.circular(100.r),
        border: border,
      ),
      child: child,
    ),
  );
}

Widget propertyCheckBox({
  required BuildContext context,
  required bool isLastIndex,
  required bool isChecked,
  required ValueChanged onChange,
  required String title,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: isLastIndex ? 0 : 16.w),
    width: MediaQuery.widthOf(context),
    height: 48.h,
    padding: EdgeInsets.symmetric(vertical: 14.h),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      border: Border.all(width: 1.r, color: AppColors.borderColor),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Row(
      children: [
        CustomCheckBox(isChecked: isChecked, onChange: onChange),
        CustomPrimaryText(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.darkColor,
        ),
      ],
    ),
  );
}
Widget rentTitle({required String title}){
  return CustomPrimaryText(
    text: title,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.darkTextColor,
  );
}
