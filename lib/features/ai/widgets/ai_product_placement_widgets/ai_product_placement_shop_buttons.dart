import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiProductPlacementShopButtons extends StatelessWidget {
  const AiProductPlacementShopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomPrimaryButton(
                borderRadius: BorderRadius.circular(16.r),
                fontSize: 12.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                text: "Replace Existing Furniture",
                onPressed: () {},
                backgroundColor: AppColors.whiteColor,
                textColor: AppColors.primaryColor,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomPrimaryButton(
                borderRadius: BorderRadius.circular(16.r),
                fontSize: 12.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                text: "Use Empty Spot",
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        SharedContainer(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          radius: 100.r,
          color: AppColors.primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    IconsPath.ai,
                    width: 24.w,
                    height: 24.h,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(width: 6.w),
                  CustomPrimaryText(
                    text: 'Generate',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    IconsPath.creditCoin,
                    width: 16.w,
                    height: 16.h,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(width: 4.w),
                  CustomPrimaryText(
                    text: '20',
                    fontSize: 16.sp,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
