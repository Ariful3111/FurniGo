import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SelfDropLocation extends StatelessWidget {
  const SelfDropLocation({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Drop-off Location',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : const Color(0xFF0A0A0F),
        ),
        SizedBox(height: 8.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPrimaryText(
              text: 'Furniture Warehouse-Main Hub',
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : const Color(0xFF292929),
            ),

            SizedBox(height: 4.h),
            CustomPrimaryText(
              text: '123 Industrial Road, City Name',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: isDark ? AppColors.whiteColor : const Color(0xFF292929),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSecondaryButton(
                  onPressed: () {},
                  icon: IconsPath.location,
                  textColor: AppColors.primaryColor,
                  text: 'View On Map',
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.71.w,
                    vertical: 11.43.h,
                  ),
                  border: Border.all(
                    width: 0.71.r,
                    color: AppColors.secondaryColor,
                  ),
                  radius: 11.r,
                ),
                SizedBox(width: 8.57.w),
                CustomSecondaryButton(
                  onPressed: () {},
                  icon: IconsPath.navigation,
                  textColor: AppColors.whiteColor,
                  text: 'Get Directions',
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.71.w,
                    vertical: 11.43.h,
                  ),
                  border: Border.all(
                    width: 0.71.r,
                    color: AppColors.secondaryColor,
                  ),
                  radius: 11.r,
                  backgroundColor: AppColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
