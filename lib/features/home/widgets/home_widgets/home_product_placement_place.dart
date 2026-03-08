import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeProductPlacementPlace extends StatelessWidget {
  const HomeProductPlacementPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(IconsPath.ai, height: 20.h, width: 20.w),
        SizedBox(width: 5.w),
        CustomPrimaryText(
          text: 'Place Your Product',
          color: AppColors.labelColor,
          fontSize: 16.sp,
        ),
        Spacer(),
        Container(
          height: 24.h,
          width: 24.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_forward,
              size: 12.sp,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
