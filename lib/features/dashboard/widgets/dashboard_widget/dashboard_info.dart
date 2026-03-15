import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class DashboardInfo extends StatelessWidget {
  const DashboardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    List item = [
      {'title': 'Active orders', 'icon': IconsPath.activeOrder, 'value': '2'},
      {'title': 'Total spent', 'icon': IconsPath.spent, 'value': '\$3,220'},
      {
        'title': 'Active rentals',
        'icon': IconsPath.activeRentals,
        'value': '2',
      },
      {'title': 'Pending quotes', 'icon': IconsPath.clock, 'value': '2'},
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 2.3,
      ),
      itemCount: item.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final element = item[index];
        return Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: isDark ? AppColors.labelColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrimaryText(
                    text: element['title'],
                    fontSize: 12.sp,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.secondaryTextColor,
                  ),
                  Image.asset(element['icon'], height: 16.h, width: 16.w),
                ],
              ),
              SizedBox(height: 13.34.h),
              CustomPrimaryText(
                text: element['value'],
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.whiteColor : AppColors.titleColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
