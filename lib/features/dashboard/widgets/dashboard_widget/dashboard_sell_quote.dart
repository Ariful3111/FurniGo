import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_property_header.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_span_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardSellQuote extends StatelessWidget {
  const DashboardSellQuote({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      child: Column(
        children: [
          DashboardPropertyHeader(title: 'Sell quote status', onTap: () {}),
          SizedBox(height: 16.h,),
          ...List.generate(2, (index) {
            return SharedContainer(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.only(bottom: index==1?0:11.h),
              radius: 16.r,
              border: Border.all(
                width: 1.r,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : Color(0xFFF3F4F6),
              ),
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
                        text: 'Oak Dining Table',
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.titleColor,
                            fontSize: 16.sp,
                      ),
                      SizedBox(height: 4.h),
                      CustomSpanText(
                        title: 'Offer:',
                        spanText: '\$450',
                        fontWeight: FontWeight.w400,
                        spanFontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColors.primaryBorderColor
                            : AppColors.secondaryTextColor,
                        spanColor: Color(0xFF21D19F),
                      ),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text: 'Submitted Dec 10, 2026',
                        fontSize: 12.sp,
                        color: isDark
                            ? AppColors.primaryBorderColor
                            : AppColors.secondaryTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  CustomTableStatus(status: 'Offer Ready'),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
