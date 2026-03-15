import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_property_header.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardActiveRentals extends StatelessWidget {
  const DashboardActiveRentals({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          DashboardPropertyHeader(title: 'Active rentals', onTap: () {}),
          SizedBox(height: 16.h),
          ...List.generate(2, (index) {
            return SharedContainer(
              padding: EdgeInsets.all(16.r),
              margin: EdgeInsets.only(bottom: 1 == index ? 0 : 11.h),
              radius: 16.r,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 28,
                  color: AppColors.shadowColor.withValues(alpha: 0.1),
                ),
              ],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20.r),
                    child: Image.asset(
                      IconsPath.furniture,
                      height: 64.h,
                      width: 64.w,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPrimaryText(
                        text: 'Modern Velvet Sofa',
                        fontSize: 16.sp,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.titleColor,
                      ),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text: 'Nov 1, 2024 — May 1,  2025',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColors.primaryBorderColor
                            : AppColors.secondaryTextColor,
                      ),
                    ],
                  ),
                  CustomTableStatus(status: 'Active'),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
