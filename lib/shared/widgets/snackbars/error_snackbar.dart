import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ErrorSnackbar {
  static SnackbarController show({
    required String description,
    double? maxWidth,
  }) {
    Get.closeAllSnackbars();
    return Get.showSnackbar(
      GetSnackBar(
        maxWidth: maxWidth,
        borderRadius: 16.r,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        backgroundColor: AppColors.whiteColor,
        leftBarIndicatorColor: Colors.transparent,
        borderColor: Colors.transparent,
        borderWidth: 0,
        boxShadows: [
          BoxShadow(
            color: const Color(0xFFFF6B6B).withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 2,
          ),
        ],
        icon: Padding(
          padding: EdgeInsets.only(right: 12.w),
          child: Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: const Color(0xFFFFB4B4),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Center(
              child: Icon(
                Icons.cancel,
                color: AppColors.whiteColor,
                size: 28.sp,
              ),
            ),
          ),
        ),
        messageText: CustomPrimaryText(
          text: description,
          fontSize: 14.sp,
          textAlign: TextAlign.start,
          color: AppColors.errorTextColor,
          textOverflow: TextOverflow.visible,
        ),
        mainButton: GestureDetector(
          onTap: () => Get.closeCurrentSnackbar(),
          behavior: HitTestBehavior.opaque,
          child: Container(
            margin: EdgeInsets.only(left: 12.w),
            padding: EdgeInsets.all(4.w),
            child: Icon(
              Icons.close_rounded,
              color: AppColors.errorIconColor,
              size: 22.sp,
            ),
          ),
        ),
        duration: const Duration(seconds: 4),
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.easeOutCubic,
        reverseAnimationCurve: Curves.easeInCubic,
        animationDuration: const Duration(milliseconds: 400),
      ),
    );
  }
}