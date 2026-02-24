import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

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
        FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            connectorTheme: ConnectorThemeData(thickness: 1),
          ),
          builder: TimelineTileBuilder.connected(
            itemCount: items.length,
            connectionDirection: ConnectionDirection.before,
            indicatorBuilder: (_, index) {
              return DotIndicator(
                size: 14,
                color: items[index]["active"] == true
                    ? Color(0xFF2B7FFF)
                    : Color(0xFFD1D5DC),
              );
            },
            connectorBuilder: (_, index, type) {
              return SolidLineConnector(color: AppColors.fieldBorderColorLight);
            },
            contentsBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.all(12.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomPrimaryText(
                      text: items[index]["date"].toString(),
                      fontWeight: items[index]["active"] == true
                          ? FontWeight.w600
                          : null,
                      color: items[index]["active"] == true
                          ? AppColors.darkTextColor
                          : Color(0xFF6A6A6A),
                      fontSize: 14.sp,
                    ),
                    CustomPrimaryText(
                      text: items[index]["date"].toString(),
                      fontWeight: items[index]["active"] == true
                          ? FontWeight.w600
                          : null,
                      color: items[index]["active"] == true
                          ? AppColors.darkTextColor
                          : Color(0xFF6A6A6A),
                      fontSize: 14.sp,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
