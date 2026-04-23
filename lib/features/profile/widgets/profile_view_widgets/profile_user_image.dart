import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/constant/images_path.dart';

class ProfileUserImage extends StatelessWidget {
  const ProfileUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      width: MediaQuery.widthOf(context),
      height: 150.h,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              ImagesPath.profileBg,
              width: MediaQuery.widthOf(context),
              height: 133.h,
            ),
          ),

          Positioned(
            bottom: -12,
            child: Container(
              padding: EdgeInsets.all(9.27.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4.r,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.secondaryColor.withValues(alpha: 0.2),
                ),
              ),
              child: Image.asset(
                IconsPath.profileNav,
                height: 83.45.h,
                width: 83.45.w,
              ),
            ),
          ),
          Positioned(
            bottom: -5.h,
            right: 142.w,
            child: Container(
              height: 32.h,
              width: 32.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
              ),
              child: Center(
                child: Image.asset(
                  IconsPath.profileEdit,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
            ),
          ),
          Positioned(
            top: -30,
            right: -30,
            child: Image.asset(
              ImagesPath.container,
              height: 128.h,
              width: 128.w,
              color: isDark ? AppColors.darkColor.withValues(alpha: 0.5) : null,
            ),
          ),
        ],
      ),
    );
  }
}
