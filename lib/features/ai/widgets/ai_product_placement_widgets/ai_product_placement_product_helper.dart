import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiProductPlacementProductHelper {
   Widget arrowButton(IconData icon) {
    return SharedContainer(
      padding: EdgeInsets.all(6.w),
      radius: 20.r,
      color: AppColors.whiteColor,
      child: Icon(icon, size: 16.sp),
    );
  }
}