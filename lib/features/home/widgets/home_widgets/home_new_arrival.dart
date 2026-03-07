import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeNewArrival extends StatelessWidget {
  const HomeNewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 240.h,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 190.h,
                  width: 196.w,
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: isDark ? Color(0xFF161616) : AppColors.fieldColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: button(
                          onTap: () {},
                          icon: IconsPath.favorite,
                          isDark: isDark,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: button(
                          onTap: () {},
                          icon: IconsPath.homeCart,
                          isDark: isDark,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          IconsPath.furniture,
                          height: 124.h,
                          width: 136.w,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomPrimaryText(
                      text: 'Modern Velvet Sofa',
                      fontSize: 12.sp,
                      color: isDark
                          ? AppColors.darkPrimaryTextColor
                          : Color(0xFF585858),
                    ),
                  ],
                ),
                CustomPrimaryText(
                  text: '\$299.00',
                  fontSize: 12.sp,
                  color: isDark ? Color(0xFF989898) : AppColors.buttonTextColor,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget button({
    required VoidCallback onTap,
    required String icon,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28.h,
        width: 28.w,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Center(
          child: Image.asset(
            icon,
            height: 16.h,
            width: 16.w,
            color: isDark ? AppColors.whiteColor : AppColors.buttonTextColor,
          ),
        ),
      ),
    );
  }
}
