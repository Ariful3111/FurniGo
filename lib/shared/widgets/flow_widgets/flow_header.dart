import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class FlowHeader extends StatelessWidget {
  final String title;
  final String sub;
  const FlowHeader({super.key, required this.title, required this.sub});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 56.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color:isDark? AppColors.labelColor:AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -5.h,
            left: -0.w,
            child: Image.asset(IconsPath.vector, height: 40.h, width: 40.w),
          ),
          Positioned(
            bottom: -3.h,
            right: -0.w,
            child: Image.asset(IconsPath.vector1, height: 40.h, width: 40.w),
          ),
          Center(
            child: Column(
              children: [
                CustomPrimaryText(text: title),
                SizedBox(height: 8.h),
                CustomPrimaryText(
                  text: sub,
                  color: AppColors.secondaryTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
