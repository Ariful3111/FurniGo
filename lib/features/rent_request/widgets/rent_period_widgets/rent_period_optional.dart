import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_period_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/other_field.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentPeriodOptional extends StatelessWidget {
  const RentPeriodOptional({super.key});

  @override
  Widget build(BuildContext context) {
    RentPeriodController rentPeriodController = Get.find();
    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Compliance & Safety (optional) ',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.titleTextColor,
          ),
          SizedBox(height: 12.h),
          CustomPrimaryText(
            text: 'Fire Safety Compliance Required?',
            fontSize: 14.sp,
            color: AppColors.titleTextColor,
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(rentPeriodController.option.length, (index) {
            return SizedBox(
              width: 171.w,
              child: Row(
                children: [
                  Obx(
                    () => CustomRadioButton(
                      value: index,
                      groupValue: rentPeriodController.selectedOption.value,
                      onChange: (value) {
                        rentPeriodController.selectedOption.value = value!;
                      },
                    ),
                  ),
                  CustomPrimaryText(
                    text: rentPeriodController.option[index],
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkColor,
                  ),
                ],
              ),
            );
          }),),
          SizedBox(height: 12.h),
          CustomPrimaryText(
            text: 'Weight/load restrictions',
            fontSize: 14.sp,
            color: AppColors.titleTextColor,
          ),
          SizedBox(height: 12.h),
          OtherField(
            controller: rentPeriodController.weightController,
            width: 158.w,
            labelText: 'Enter Weight/Load',
            keyboardType: TextInputType.numberWithOptions(),
          ),
          SizedBox(height: 12.h),
          CustomPrimaryText(
            text: 'OH&S requirements',
            fontSize: 14.sp,
            color: AppColors.titleTextColor,
          ),
          SizedBox(height: 12.h),
          OtherField(
            controller: rentPeriodController.requirementController,
            width: 192.w,
            labelText: 'Write here',
          ),
        ],
      ),
    );
  }
}
