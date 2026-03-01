import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class DashboardPaymentHeader extends StatelessWidget {
  const DashboardPaymentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomPrimaryText(
                      text: 'Rental RNT-2024-001',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CustomTableStatus(status: 'Active'),
                ],
              ),
              SizedBox(height: 4.h),
              CustomPrimaryText(
                text: 'Started Nov 1, 2023',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.secondaryTextColor,
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomPrimaryText(
              text: 'Next Payment',
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.labelColor,
            ),
            SizedBox(height: 4.h),
            CustomPrimaryText(
              text: '\$125.00',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.labelColor,
            ),
            SizedBox(height: 4.h),
            CustomPrimaryText(
              text: 'Due Nov 15, 2023',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.labelColor,
            ),
          ],
        ),
      ],
    );
  }
}
