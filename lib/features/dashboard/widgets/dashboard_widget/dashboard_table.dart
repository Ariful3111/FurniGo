import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class DashboardTable extends StatelessWidget {
  const DashboardTable({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.r),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: isDark ? AppColors.labelColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 69.h,
            width: MediaQuery.widthOf(context),
            child: Padding(
              padding: EdgeInsets.only(left:20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrimaryText(
                    text: 'Recent orders',
                    color: isDark ? AppColors.whiteColor : AppColors.titleColor,
                  ),
                  GestureDetector(
                    onTap: () {},
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
            ),
          ),
          CustomDivider(),
        ],
      ),
    );
  }
}
