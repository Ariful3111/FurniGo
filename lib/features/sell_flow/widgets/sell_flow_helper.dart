import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SellFlowHelper {
  Widget myButton({
    BoxBorder? border,
    required VoidCallback onTap,
    Color? color,
    required Widget child,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: color ?? AppColors.whiteColor,
          borderRadius: BorderRadius.circular(100.r),
          border: border,
        ),
        child: child,
      ),
    );
  }

  Widget warningBox({
    required String title,
    required String subtitle,
    Color? color,
    Border? border,
    Color ? iconColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? Color(0xFFFEFCE8),
        borderRadius: BorderRadius.circular(16),
        border: border ?? Border.all(color: Color(0xFFFFF085)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: iconColor ?? Color(0xFFD08700)),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF733E0A),
                ),
                CustomPrimaryText(
                  text: subtitle,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFA65F00),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
 Widget buildSuccessBox() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Color(0xFFDCFCE7),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Color(0xFF86EFAC)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Color(0xFF22C55E), size: 24.r),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryText(
                  text: 'All photos uploaded!',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF166534),
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: 'You can now proceed to the next step.',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF15803D),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildUploadButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SharedContainer(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),

        color: AppColors.whiteColor,
        border: Border.all(width: 1, color: AppColors.buttonBorderColor),
        radius: 100.r,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CustomPrimaryText(
                text: text,
                fontSize: 12.sp,
                color: AppColors.labelColor,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 4.w),
            Image.asset(
              text.contains('Gallery') ? IconsPath.image : IconsPath.camera,
              width: 16.r,
              height: 16.r,
              color: AppColors.labelColor,
            ),
          ],
        ),
      ),
    );
  }
}
