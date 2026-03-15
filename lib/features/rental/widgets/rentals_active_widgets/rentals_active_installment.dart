import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_timeline/custom_payment_timeline.dart';

class RentalsActiveInstallment extends StatelessWidget {
  const RentalsActiveInstallment({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {"date": "Oct 15", "amount": "\$125.00", "active": true, 'paid': 'Paid'},
      {"date": "Nov 15", "amount": "\$125.00", "active": false, 'paid': 'Paid'},
      {"date": "Dec 15", "amount": "\$125.00", "active": false, 'paid': 'Paid'},
    ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(text: 'Plan type', isDark: isDark),
        SizedBox(height: 4.h),
        CustomPrimaryText(
          text: 'Installment',
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 16.h),
        text(text: 'Plan Schedule', isDark: isDark),
        ...List.generate(items.length, (index) {
          return SizedBox(
            height: 40.h,
            child: CustomPaymentTimeline(
              isFirst: index == 0 ? true : false,
              isCurrentStatus: items[index]["active"] == true,
              isLast: items.length-1==index?true:false,
              endChild: Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomPrimaryText(
                      text: items[index]["date"].toString(),
                      fontWeight: items[index]["active"] == true
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: items[index]["active"] == true
                          ? isDark
                                ? AppColors.whiteColor
                                : AppColors.darkTextColor
                          : isDark
                          ? AppColors.darkPrimaryTextColor
                          : Color(0xFF6A6A6A),
                      fontSize: 14.sp,
                    ),
                    CustomPrimaryText(
                      text: items[index]["amount"].toString(),
                      fontWeight: items[index]["active"] == true
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: items[index]["active"] == true
                          ? isDark
                                ? AppColors.whiteColor
                                : AppColors.darkTextColor
                          : isDark
                          ? AppColors.darkPrimaryTextColor
                          : Color(0xFF6A6A6A),
                      fontSize: 14.sp,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
