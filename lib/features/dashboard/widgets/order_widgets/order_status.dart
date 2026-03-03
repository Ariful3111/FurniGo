import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_timeline/custom_payment_timeline.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {'title': 'Order Shipped', 'date': 'Today, 9:41 AM', 'active': true},
      {'title': 'Order Confirm', 'date': 'Nov 10, 2023', 'active': false},
    ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      radius: 20.r,
      padding: EdgeInsets.all(16.r),
      color: isDark ? AppColors.darkColor : Color(0xFFF3F3F3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Status Updates',
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: isDark ? AppColors.whiteColor : AppColors.greyColor,
          ),
          SizedBox(height: 8.h),
          ...List.generate(items.length, (index) {
            final firstIndex = index == 0;
            return SizedBox(
              height: 80.h,
              child: CustomPaymentTimeline(
                isFirst: firstIndex ? true :false,
                indicatorXY: 0.1,
                endChild: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPrimaryText(
                        text: items[index]['title'],
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: items[index]["active"] == true
                            ? isDark
                                  ? AppColors.whiteColor
                                  : AppColors.darkTextColor
                            : isDark
                            ? AppColors.darkPrimaryTextColor
                            : Color(0xFF6A6A6A),
                      ),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text: items[index]['date'],
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: items[index]['active'] == true
                            ? isDark
                                  ? AppColors.primaryBorderColor
                                  : AppColors.greyColor
                            : isDark
                            ? Color(0xFF989898)
                            : AppColors.greyColor,
                      ),
                    ],
                  ),
                ),
                isCurrentStatus: items[index]["active"] == true,
                isLast: items.length-1==index? true: false,
              ),
            );
          }),
        ],
      ),
    );
  }
}
