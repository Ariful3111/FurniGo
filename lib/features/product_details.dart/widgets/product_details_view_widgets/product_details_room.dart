import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsRoom extends StatelessWidget {
  const ProductDetailsRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, String>> steps = [
      {
        "title": "Upload your space",
        "subtitle": "Add a room photo or enter dimensions.",
        "icon": IconsPath.upload,
      },
      {
        "title": "Pick your style",
        "subtitle": "Choose colors, furniture types, and vibe.",
        "icon": IconsPath.wood,
      },
      {
        "title": "Get instant designs",
        "subtitle": "Save, share, and shop items from the result.",
        "icon": IconsPath.speed,
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: List.generate(steps.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: _stepItem(
                  title: steps[index]["title"]!,
                  subtitle: steps[index]["subtitle"]!,
                  isDark: isDark,
                  icon: steps[index]["icon"]!,
                ),
              );
            }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryButton(
                text: 'Make your room',
                onPressed: () {},
                width: 170.w,
              ),
              SizedBox(height: 12.h),
              CustomPrimaryText(
                text: 'Free to try • No credit card required',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : Color(0xFF938AA5),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stepItem({
    required String title,
    required String subtitle,
    required bool isDark,
    required String icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            icon,
            height: 20.h,
            width: 20.w,
            color: isDark ? AppColors.whiteColor : AppColors.primaryColor,
          ),
        ),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(text: title, fontSize: 16.sp),
              SizedBox(height: 4.h),
              CustomPrimaryText(
                text: subtitle,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : Color(0xFF938AA5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
