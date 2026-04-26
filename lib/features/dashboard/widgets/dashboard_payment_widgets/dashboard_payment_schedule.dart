import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/dashboard/controller/dashboard_payment_controller.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_payment_widgets/dashboard_payment_schedule_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_dialog_animation.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_payment_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/custom_timeline/custom_payment_timeline.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardPaymentSchedule extends GetWidget<DashboardPaymentController> {
  const DashboardPaymentSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final LineStyle thinLine = LineStyle(
      thickness: 1.5.w,
      color: Color(0xFFDADADA),
    );
    return SharedContainer(
      padding: EdgeInsets.all(20.r),
      radius: 20.sp,
      color: isDark ? AppColors.buttonTextColor : const Color(0xFFF4F4F4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Payment Schedule',
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 14.h),
          ...List.generate(DashboardPaymentScheduleHelper.items.length, (
            index,
          ) {
            final item = DashboardPaymentScheduleHelper.items[index];
            final dotColor = DashboardPaymentScheduleHelper().dotColor(
              item.state,
            );
            final double dotSize = item.state == PaymentState.future
                ? 10.w
                : 12.w;
            return SizedBox(
              height: 50.h,
              child: CustomPaymentTimeline(
                isFirst: index == 0,
                isLast:
                    index == DashboardPaymentScheduleHelper.items.length - 1,
                color: dotColor,

                indicator: Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: dotColor,
                  ),
                ),
                indicatorXY: 0.5,
                padding: EdgeInsets.symmetric(vertical: 0.1.h),
                beforeLineStyle: thinLine,
                afterLineStyle: thinLine,
                endChild: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: DashboardPaymentScheduleHelper().rowContent(
                    item,
                    isDark,
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 14.h),
          CustomPrimaryButton(
            text: 'Pay Early',
            onPressed: () {
              CustomDialogAnimation().showAnimatedDialog(
                context: context,
                dialog: CustomPaymentDialog(
                  icon: IconsPath.success,
                  cardList: controller.cardList,
                  selectedCard: controller.selectedCard,
                  onSelect: (value) {
                    if (value != null) controller.selectedCard.value = value;
                  },
                ),
                isDark: isDark,
              );
            },
          ),
        ],
      ),
    );
  }
}
