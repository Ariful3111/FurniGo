import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomPaymentTimeline extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isCurrentStatus;
  final Widget endChild;
  final Widget ?startChild;
  final Widget? indicator;
  final double ? indicatorXY;
  final EdgeInsets ? padding;
  final LineStyle? afterLineStyle;
  const CustomPaymentTimeline({
    super.key,
    required this.isFirst,
    required this.isCurrentStatus,
    required this.isLast,
    required this.endChild,
     this.startChild, this.indicator, this.indicatorXY, this.padding, this.afterLineStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      indicatorStyle: IndicatorStyle(
        width: 12.w,
        color: isCurrentStatus == true ? Color(0xFF2B7FFF) : Color(0xFFACACAC),
        indicator: indicator,
        indicatorXY: indicatorXY??0.5,
        padding: padding??EdgeInsets.zero,
      ),
      beforeLineStyle: LineStyle(thickness: 4.w, color: Color(0xFFDADADA),),
      afterLineStyle: afterLineStyle,
      endChild: endChild,
      startChild: startChild,
      isLast: isLast,
    );
  }
}
