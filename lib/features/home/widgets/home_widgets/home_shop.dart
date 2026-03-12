import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeShop extends StatelessWidget {
  const HomeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(bottom: 12.h),
            margin: EdgeInsets.only(right: 8.w),
            height: 100.h,
            width: 170.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagesPath.home),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.low,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomPrimaryText(
                text: 'living room',
                fontSize: 14.sp,
                color: AppColors.whiteColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
