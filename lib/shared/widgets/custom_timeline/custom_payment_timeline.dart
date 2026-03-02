import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPaymentTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const CustomPaymentTimeline({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return FixedTimeline.tileBuilder(
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
                  text: items[index]["date"],
                  fontWeight: items[index]["active"] == true
                      ? FontWeight.w600
                      : FontWeight.w400,
                  color: items[index]["active"] == true
                      ?isDark? AppColors.whiteColor: AppColors.darkTextColor
                      : isDark? AppColors.darkPrimaryTextColor:Color(0xFF6A6A6A),
                  fontSize: 14.sp,
                ),
                CustomPrimaryText(
                  text: items[index]["amount"],
                  fontWeight: items[index]["active"] == true
                      ? FontWeight.w600
                      : FontWeight.w400,
                  color: items[index]["active"] == true
                      ?isDark? AppColors.whiteColor: AppColors.darkTextColor
                      :isDark? AppColors.darkPrimaryTextColor:Color(0xFF6A6A6A),
                  fontSize: 14.sp,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
