import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RevisionDialog extends StatelessWidget {
  const RevisionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.widthOf(context),
        height: 270.h,
        padding: EdgeInsets.all(13.58.r),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16.3.r),
          boxShadow: [rentalShadow(y: 5.43, blur: 19.02)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(IconsPath.revision, height: 101.89.h, width: 101.89.w),
            SizedBox(height: 21.h),
            CustomPrimaryText(
              text: 'Your Revision Request has been submitted',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.whiteColor : AppColors.labelColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            CustomPrimaryText(
              text:
                  'Your request will be reviewed by our team.\n We\'ll send you a revised quote',
              fontSize: 12.sp,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.greyTextColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  IconsPath.clock,
                  height: 12.h,
                  width: 12.w,
                  color: isDark ? AppColors.whiteColor : null,
                ),
                SizedBox(width: 4.h),
                CustomPrimaryText(
                  text: 'Estimated review time: 24-48 hours',
                  color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
