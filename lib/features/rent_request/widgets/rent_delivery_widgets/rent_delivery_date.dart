import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/utils/date_picker.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_delivery_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/other_field.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_date_fields.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentDeliveryDate extends GetWidget<RentDeliveryController> {
  const RentDeliveryDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Availability1',
          fontSize: 14.sp,
          color: AppColors.titleTextColor,
        ),
        SizedBox(height: 8.h),
        CustomDateField(
          controller: controller.deliveryDateController,
          onTap: () {
            DatePicker.pickDate(
              context: context,
              onDateSelected: (date) {
                final String formattedDate =
                    '${date.day}/${date.month}/${date.year}';
                controller.deliveryDateController.text = formattedDate;
              },
            );
          },
        ),
        SizedBox(height: 12.h),
        CustomPrimaryText(
          text: 'Preferred Time Period *',
          fontSize: 14.sp,
          color: AppColors.titleTextColor,
        ),
        SizedBox(height: 12.h),
        ...List.generate(
          controller.timePeriod.length,
          (index) => Obx(
            () => Row(
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
                        readOnly: controller.selectedTimePeriod.value != 3,
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
        SizedBox(height: 15.h),
        Container(
          width: 85.w,
          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(color: AppColors.buttonBorderColor,width: 1.r),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Row(children: [
            Icon(Icons.add,color: Color(0xFF111111),size: 16.r,),
            SizedBox(width: 4.w,),
            CustomPrimaryText(
              text: 'Date',
              fontSize: 12.sp,
              color: AppColors.labelColor,
            ),
          ],),)
      ],
    );
  }
}
