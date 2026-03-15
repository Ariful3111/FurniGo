import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeAiDesignStep extends StatelessWidget {
  const HomeAiDesignStep({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    List title = [
      'Click Your Room',
      'Pick Your Style',
      'AI Transforms Your Room',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          child: Row(
            children: [
              circle(step: '01', isDark: isDark),
              line(),
              circle(step: '02', isDark: isDark),
              line(),
              circle(step: '03', isDark: isDark),
            ],
          ),
        ),
        SizedBox(height: 9.41.h),
        Padding(
          padding: EdgeInsets.only(left: 38.w, right: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(title.length, (index) {
              return CustomPrimaryText(
                text: title[index],
                fontSize: 8.sp,
                color:isDark?AppColors.boxColor: Color(0xFF62547C),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget circle({required String step, required bool isDark}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 32.94.h,
          width: 32.94.h,
          decoration: BoxDecoration(
            color:isDark? AppColors.boxColor:AppColors.primaryColor,
            borderRadius: BorderRadius.circular(18.82.r),
          ),
          child: Center(
            child: CustomPrimaryText(
              text: step,
              fontSize: 14.sp,
              color:isDark? AppColors.darkColor:AppColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget line() {
    return Expanded(
      child: DottedLine(
        dashColor: AppColors.primaryColor,
        lineThickness: 1.r,
        dashGapLength: 4.w,
        dashLength: 6.w,
      ),
    );
  }
}
