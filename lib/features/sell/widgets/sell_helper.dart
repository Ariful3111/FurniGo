import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SellHelper {
  Widget sellHeader({required bool isDark, required BuildContext context,String ? icon,required VoidCallback onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppbar(
          title: 'Sell Quotes',
          icon: icon,
          onDrawerTap: onTap,
        ),
        SizedBox(height: 12.h),
        SharedContainer(
          radius: 12.r,
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: 'Sell Quotes',
                color: isDark ? AppColors.whiteColor : AppColors.titleColor,
              ),
              SizedBox(height: 4.h),
              CustomPrimaryText(
                text:
                    'Track your quote status, offers, scheduling, and EFT remittance details.',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.secondaryTextColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
