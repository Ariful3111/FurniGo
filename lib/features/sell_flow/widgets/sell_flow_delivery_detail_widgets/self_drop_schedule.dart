import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/utils/date_picker.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_delivery_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_delivery_detail_widgets/self_drop_schedule_date.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_date_fields.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SelfDropSchedule extends GetWidget<SellFlowDeliveryController> {
  const SelfDropSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Drop-off Schedule',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.titleTextColor,
        ),
        SizedBox(height: 4.h),
        CustomPrimaryText(
          text:
              'Choose when you plan to drop off your furniture at our warehouse.',
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: isDark
              ? AppColors.primaryBorderColor
              : AppColors.titleTextColor,
        ),
        SizedBox(height: 15.h),
        CustomPrimaryText(
          text: 'Select Date',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 8.h),
        CustomDateField(
          onTap: () {
            DatePicker.pickDate(
              context: context,
              onDateSelected: (date) {
                String formattedDate =
                    '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
                controller.selfDateController.text = formattedDate;
              },
            );
          },
          controller: controller.selfDateController,
        ),
        SizedBox(height: 12.h),
        CustomPrimaryText(
          text: 'Preferred Time Period*',
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: isDark ? AppColors.whiteColor : AppColors.titleTextColor,
        ),
        SizedBox(height: 12.h),
        SelfDropScheduleDate(),
      ],
    );
  }
}
