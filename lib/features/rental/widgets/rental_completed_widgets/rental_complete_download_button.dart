import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalCompleteDownloadButton extends StatelessWidget {
  const RentalCompleteDownloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(width: 1.r, color: AppColors.buttonBorderColor),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(IconsPath.download, height: 16.h, width: 16.w),
          SizedBox(width: 4.w),
          CustomPrimaryText(
            text: 'Download Invoices',
            fontSize: 12.sp,
            color:  AppColors.labelColor,
          ),
        ],
      ),
    );
  }
}
