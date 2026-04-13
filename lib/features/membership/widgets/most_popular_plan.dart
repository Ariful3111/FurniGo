import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class MostPopularPlan extends StatelessWidget {
  final Map<String, dynamic> data;
  const MostPopularPlan({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SharedContainer(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      radius: 8.r,
      color: AppColors.whiteColor,
      border: Border.all(color: AppColors.darkColor),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 12,
          color: AppColors.shadowColor.withValues(alpha: 0.08),
        ),
      ],
      child: Row(
        children: [
          Image.asset(IconsPath.fire, height: 16.h, width: 16.w),
          SizedBox(width: 8.w),
          CustomPrimaryText(
            text: data["badge"],
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.buttonTextColor,
          ),
        ],
      ),
    );
  }
}