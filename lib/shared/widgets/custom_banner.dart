import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: 180.h,
      width: 400.w,
      decoration: BoxDecoration(
        gradient: AppColors.bannerBG,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 40,
            spreadRadius: -12,
            color: AppColors.darkColor.withValues(alpha: 0.25),
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.w, top: 20.h, bottom: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(IconsPath.star, height: 32.h, width: 32.w),
                SizedBox(height: 8.h),
                CustomPrimaryText(
                  text: 'Unlock Premium',
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: 'AI designs, collections, and exclusive benefits',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFE9D4FF),
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 40.h,
                    width: 179.w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 6,
                          spreadRadius: -4,
                          color: AppColors.darkTextColor.withValues(alpha: 0.1),
                        ),
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: -3,
                          color: AppColors.darkTextColor.withValues(alpha: 0.1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: CustomPrimaryText(
                        text: 'View plans',
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: isDark?AppColors.primaryColor:null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: -30,
            right: -30,
            child: Image.asset(
              ImagesPath.container,
              height: 128.h,
              width: 128.w,
            ),
          ),
        ],
      ),
    );
  }
}
