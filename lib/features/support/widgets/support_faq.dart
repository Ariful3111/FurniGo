import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SupportFaq extends StatelessWidget {
  const SupportFaq({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.w),
      radius: 24.r,
      color: isDark ? AppColors.darkColor : AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: "FAQ",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.titleColor,
          ),
          SizedBox(height: 12.h),
          Column(
            children: List.generate(2, (index) {
              return SharedContainer(
                margin: EdgeInsets.only(bottom: index==1?0:12.h),
                padding: EdgeInsets.all(12.w),
                radius: 16.r,
                color: isDark ? AppColors.darkColor : AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x1414132A),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPrimaryText(
                      text: 'How do I track my delivery?',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.titleColor,
                    ),
                    SizedBox(height: 4.h),
                    CustomPrimaryText(
                      text:
                          'Go to "My Orders" and click on the tracking number provided.',
                      fontSize: 14.sp,
                      color: AppColors.secondaryTextColor,
                    ),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 14.h),
          CustomPrimaryText(
            text: "View all FAQs",
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color:isDark? AppColors.whiteColor:AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
