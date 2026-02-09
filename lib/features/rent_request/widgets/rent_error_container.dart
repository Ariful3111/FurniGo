import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class RentErrorContainer extends StatelessWidget {
  final Widget text;
  const RentErrorContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: AppColors.errorContainerColor,
        border: Border.all(width: 1.2.r, color: AppColors.errorBorderColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Image.asset(
            IconsPath.info,
            height: 20.h,
            width: 20.w,
            color: AppColors.errorIconColor,
          ),
          SizedBox(width: 12.w),
          Expanded(child: text),
        ],
      ),
    );
  }
}
