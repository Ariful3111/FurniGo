import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentHelper {
  static Widget optionContainer({
    required BuildContext context,
    required Widget child,
  }) {
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

  static Widget myButton({
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

  static Widget propertyCheckBox({
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

  static Widget rentTitle({required String title}) {
    return CustomPrimaryText(
      text: title,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.darkTextColor,
    );
  }

  Widget propertyImageView({
    required String path,
    required VoidCallback onRemove,
    required BuildContext context,
  }) {
    return SharedContainer(
      height: 210.h,
      padding: EdgeInsets.zero,
      width: MediaQuery.widthOf(context),
      radius: 16.r,
      border: Border.all(width: 1.2.r, color: const Color(0xFFD1D5DC)),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.file(File(path), fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.darkColor.withValues(alpha: 0.6),
                ),
                child: Icon(Icons.close, size: 16.r, color: AppColors.whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
