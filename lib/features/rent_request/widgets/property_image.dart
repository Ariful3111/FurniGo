import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class PropertyImage extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const PropertyImage({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      height: 210.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(width: 1.2.r, color: Color(0xFFD1D5DC)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IconsPath.box, height: 48.h, width: 48.w),
          SizedBox(height: 16.h),
          CustomPrimaryText(
            text: title,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.secondaryTextColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(width: 1.r, color: Color(0xFFD1D7E0)),
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: CustomPrimaryText(
                text: 'Choose File',
                color: AppColors.labelColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
