import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class DashboardPropertyHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const DashboardPropertyHeader({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomPrimaryText(
            text: title,
            color: isDark ? AppColors.whiteColor : AppColors.titleColor,
          ),
          GestureDetector(
            onTap: onTap,
            child: SizedBox(
              height: 36.h,
              width: 101.w,
              child: Row(
                children: [
                  CustomPrimaryText(
                    text: 'View all',
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                  SizedBox(width: 9.87.w),
                  Icon(
                    Icons.arrow_forward,
                    color: isDark
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                    fontWeight: FontWeight.w900,
                    size: 16.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
