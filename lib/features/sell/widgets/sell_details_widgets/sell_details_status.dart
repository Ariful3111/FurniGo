import 'package:flutter/material.dart' hide StepState;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/sell/controller/sell_details_controller.dart';
import 'package:zb_dezign/features/sell/widgets/sell_details_widgets/sell_details_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SellDetailsStatus extends GetWidget<SellDetailsController> {

  final String? sellStatus;

  const SellDetailsStatus({super.key, required this.sellStatus});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final helper = SellDetailsHelper();

    final List<TimelineStep> steps = controller.stepsFor(sellStatus);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Status',
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 18.h),
          ...List.generate(steps.length, (index) {
            final TimelineStep step = steps[index];
            final bool isFirst = index == 0;
            final bool isLast  = index == steps.length - 1;
            final Color beforeColor = isFirst
                ? Colors.transparent
                : helper.lineColor(steps[index - 1].state);
            final Color afterColor = helper.lineColor(step.state);

            return SizedBox(
              height: 95.h,
              child: TimelineTile(
                axis: TimelineAxis.vertical,
                alignment: TimelineAlign.start,
                isFirst: isFirst,
                isLast: isLast,
                indicatorStyle: IndicatorStyle(
                  width: 44.w,
                  height: 44.w,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  indicatorXY: 0.0,
                  indicator: helper.indicator(step.state, index),
                ),
                beforeLineStyle: LineStyle(color: beforeColor, thickness: 2.w),
                afterLineStyle:  LineStyle(color: afterColor,  thickness: 2.w),
                endChild: Padding(
                  padding: EdgeInsets.only(left: 16.w, top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomPrimaryText(
                        text: step.title,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.titleColor,
                      ),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        // Show the date when done, 'Pending' otherwise
                        text: step.state == StepState.done
                            ? (step.date ?? '')
                            : 'Pending',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColors.primaryBorderColor
                            : AppColors.greyColor,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 8.h),
          CustomDivider(),
        ],
      ),
    );
  }
}