import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomPaymentTimeline extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final Widget? Function(BuildContext, int)? child;
  final Color? lineColor;
  final double? lineThickness;
  final double? lineHeight;
  final EdgeInsets? padding;
  final Widget Function(BuildContext)? lastConnectorBuilder;
  final EdgeInsets? contentsPadding;
  final double? nodePosition;
  const CustomPaymentTimeline({
    super.key,
    required this.items,
    this.child,
    this.lineColor,
    this.lineThickness,
    this.padding,
    this.lastConnectorBuilder,
    this.lineHeight,
    this.contentsPadding,
    this.nodePosition,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final buildChild =
        child ??
        (_, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPrimaryText(
                text: items[index]["date"],
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
                text: items[index]["amount"],
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
          );
        };
    return FixedTimeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: nodePosition ?? 0,
        connectorTheme: ConnectorThemeData(thickness: lineThickness ?? 4.r),
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: items.length,
        indicatorBuilder: (_, index) {
          return Padding(
            padding: padding ?? EdgeInsets.symmetric(vertical: 4.h),
            child: DotIndicator(
              size: 16.r,
              color: items[index]["active"] == true
                  ? Color(0xFF2B7FFF)
                  : Color(0xFFD1D5DC),
            ),
          );
        },
        connectorBuilder: (_, index, type) {
          return SizedBox(
            height: lineHeight ?? 12.h,
            child: SolidLineConnector(
              color: lineColor ?? AppColors.fieldBorderColorLight,
            ),
          );
        },
        lastConnectorBuilder: lastConnectorBuilder,
        contentsBuilder: (context, index) {
          final built = buildChild(context, index);
          if (built == null) {
            return SizedBox.shrink();
          }
          return Padding(
            padding: contentsPadding ?? EdgeInsets.only(left: 8.h),
            child: built,
          );
        },
      ),
    );
  }
}
