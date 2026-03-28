import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_delivery_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SelfDropScheduleDate extends GetWidget<SellFlowDeliveryController> {
  const SelfDropScheduleDate({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Column(
            children: List.generate(controller.timeSlots.length, (index) {
              return GestureDetector(
                onTap: () {
                  controller.selfSelectedTimeIndex.value = index;
                },
                child: Row(
                  children: [
                    CustomRadioButton(
                      value: index,
                      groupValue: controller.selfSelectedTimeIndex.value,
                      onChange: (val) {
                        controller.selfSelectedTimeIndex.value = val;
                      },
                    ),
                    Expanded(
                      child: CustomPrimaryText(
                        text: controller.timeSlots[index],
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.darkColor,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 20.h),
        SellFlowHelper().warningBox(
          title: 'Please bring the same item shown in photos.',
          subtitle: 'Condition mismatch may affect the final quote.',
        ),
      ],
    );
  }
}
