import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomPaymentTimeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final Color color;
  final Widget endChild;
  final Widget? startChild;
  final Widget? indicator;
  final double? indicatorXY;
  final EdgeInsets? padding;
  final LineStyle? afterLineStyle;
  final LineStyle?
  beforeLineStyle; // ← new optional param, defaults to original
  final bool? isCurrentStatus;

  const CustomPaymentTimeline({
    super.key,
    required this.isFirst,
    required this.color,
    required this.isLast,
    required this.endChild,
    this.startChild,
    this.indicator,
    this.indicatorXY,
    this.padding,
    this.afterLineStyle,
    this.beforeLineStyle,
    this.isCurrentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: 12.w,
        color: color,
        indicator: indicator,
        indicatorXY: indicatorXY ?? 0.5,
        padding: padding ?? EdgeInsets.zero,
      ),
      // Use caller-supplied beforeLineStyle, otherwise fall back to the
      // original hardcoded value so all other usages stay unchanged.
      beforeLineStyle:
          beforeLineStyle ??
          LineStyle(thickness: 4.w, color: const Color(0xFFDADADA)),
      afterLineStyle: afterLineStyle,
      endChild: endChild,
      startChild: startChild,
    );
  }
}
