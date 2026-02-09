import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentSubmitDialog extends StatelessWidget {
  const RentSubmitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(16.r),
      backgroundColor:AppColors.whiteColor,
      elevation: 0,
      child: Container(
        height: 320.h,
        width: MediaQuery.widthOf(context),
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withValues(alpha: 0.1),
              offset: const Offset(0, 6.58),
              blurRadius: 23.01,
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(IconsPath.success, height: 180.h, width: 180.w),
            CustomPrimaryText(
              text: 'Your Request has been submitted',
              fontWeight: FontWeight.w600,
              color: AppColors.labelColor,
            ),
            SizedBox(height: 8.h),
            CustomPrimaryText(
              text:
                  'Your request will be reviewed by our team. We\'ll send you a detailed quote',
              fontSize: 14.sp,
              color: AppColors.greyTextColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(IconsPath.clock, height: 16.h, width: 16.w),
                SizedBox(width: 6.w),
                CustomPrimaryText(
                  text: 'Estimated review time:24-48 hours',
                  fontSize: 14.sp,
                  color: AppColors.labelColor,
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
