import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_delivery_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/other_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentDeliveryTime extends GetWidget<RentDeliveryController> {
  const RentDeliveryTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(controller.timeIndex.length, (i) {
            return Padding(
              padding: EdgeInsetsGeometry.only(
                bottom: controller.timeIndex.length - 1 == i ? 0 : 12.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  controller.timePeriod.length,
                  (index) => Row(
                    children: [
                      CustomRadioButton(
                        value: index,
                        groupValue: controller.selectedTimePeriod.value,
                        onChange: (value) {
                          controller.selectedTimePeriod.value = value;
                        },
                      ),
                      controller.timePeriod[index] == 'other'
                          ? OtherField(
                              controller: controller.otherDateController,
                              readOnly:
                                  controller.selectedTimePeriod.value != 3,
                              width: 251.w,
                            )
                          : CustomPrimaryText(
                              text: controller.timePeriod[index],
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkColor,
                            ),
                    ],
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 15.h),
          GestureDetector(
            onTap: () {
              controller.timeIndex.add(0);
            },
            child: Container(
              width: 85.w,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                border: Border.all(
                  color: AppColors.buttonBorderColor,
                  width: 1.r,
                ),
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Row(
                children: [
                  Icon(Icons.add, color: Color(0xFF111111), size: 16.r),
                  SizedBox(width: 4.w),
                  CustomPrimaryText(
                    text: 'Date',
                    fontSize: 12.sp,
                    color: AppColors.labelColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
