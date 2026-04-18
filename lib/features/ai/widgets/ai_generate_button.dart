import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiGenerateButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? title;
  const AiGenerateButton({super.key, required this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SharedContainer(
        width: MediaQuery.widthOf(context),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        radius: 100.r,
        color: AppColors.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  IconsPath.ai,
                  width: 24.w,
                  height: 24.h,
                  color: AppColors.whiteColor,
                ),
                SizedBox(width: 6.w),
                CustomPrimaryText(
                  text:title?? 'Generate',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  IconsPath.creditCoin,
                  width: 16.w,
                  height: 16.h,
                  color: AppColors.whiteColor,
                ),
                SizedBox(width: 4.w),
                CustomPrimaryText(
                  text: '20',
                  fontSize: 16.sp,
                  color: AppColors.whiteColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
