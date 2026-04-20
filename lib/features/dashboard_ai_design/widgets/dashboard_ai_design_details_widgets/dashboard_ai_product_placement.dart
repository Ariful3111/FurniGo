import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardAiProductPlacement extends StatelessWidget {
  const DashboardAiProductPlacement({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Product Placement 01',
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        CustomPrimaryText(
          text: 'Keep important places saved for easy access',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: isDark
              ? AppColors.primaryBorderColor
              : AppColors.greyTextColor,
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            text(text: 'Select Your Room', isDark: isDark),
            SizedBox(width: 52.w),
            text(text: ':', isDark: isDark),
            SizedBox(width: 22.w),
            text(
              text: 'Living Room',
              fontWeight: FontWeight.w400,
              isDark: isDark,
            ),
          ],
        ),
        SizedBox(height: 22.h),
        Row(
          children: [
            text(text: 'Selected Item', isDark: isDark),
            SizedBox(width: 78.w),
            text(text: ':', isDark: isDark),
            SizedBox(width: 10.w),
            Expanded(
              child: SizedBox(
                height: 40.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return SharedContainer(
                      margin: EdgeInsets.only(right: index == 9 ? 0 : 16.w),
                      width: 40.h,
                      height: 40.h,
                      radius: 6.3.r,
                      padding: EdgeInsets.zero,
                      color: isDark
                          ? AppColors.labelColor
                          : AppColors.fieldColor,
                      child: Center(
                        child: Image.asset(
                          IconsPath.furniture,
                          height: 22.88.h,
                          width: 24.93.w,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget text({
    required String text,
    required bool isDark,
    FontWeight? fontWeight,
  }) {
    return CustomPrimaryText(
      text: text,
      fontWeight: fontWeight ?? FontWeight.w600,
      fontSize: 14.sp,
      color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
    );
  }
}
