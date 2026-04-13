import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ActiveAnnualSubscription extends StatelessWidget {
  const ActiveAnnualSubscription({super.key});

  final List<Map<String, String>> data = const [
    {"title": "Purchase Date", "value": "12 Jan 2026"},
    {"title": "Expiry Date", "value": "12 Feb 2026"},
    {"title": "Next Renewal", "value": "12 Feb 2026"},
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              data.length,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: CustomPrimaryText(
                  text: data[index]["title"]!,
                  fontSize: 14.sp,
                  color: AppColors.greyTextColor,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: SizedBox(
            height: data.length * 40.h,
            child: Container(
              height: 124.h,
              width: 1.w,
              color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              data.length,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: CustomPrimaryText(
                  text: data[index]["value"]!,
                  fontSize: 14.sp,
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.darkTextColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
