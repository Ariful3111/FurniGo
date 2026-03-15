import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_property_header.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardPaymentItems extends StatelessWidget {
  const DashboardPaymentItems({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      radius: 20.r,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      border: Border.all(
        width: 0.86.r,
        color: isDark
            ? AppColors.darkBorderColor
            : AppColors.primaryBorderColor,
      ),
      child: Column(
        children: [
          DashboardPropertyHeader(title: 'Included Items', onTap: () {}),
          SizedBox(height: 20.h),
          ...List.generate(3, (index) {
            return SharedContainer(
              margin: EdgeInsets.only(bottom:2==index? 0:10.h),
              radius: 18.r,
              padding: REdgeInsets.all(10.r),
              border: Border.all(
                width: 1.04.r,
                color: isDark ? AppColors.darkBorderColor : Color(0xFFF3F4F6),
              ),
              child: Row(
                children: [
                  Image.asset(
                    IconsPath.furniture,
                    height: 55.25.h,
                    width: 55.25.w,
                  ),
                  SizedBox(width: 14.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPrimaryText(
                        text: 'ErgoChair Pro',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text: 'Refurbished Condition',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColors.primaryBorderColor
                            : AppColors.greyColor,
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomPrimaryText(
                    text: '\$2,999.00',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.whiteColor
                        : AppColors.darkTextColor,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
