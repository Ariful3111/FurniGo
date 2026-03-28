import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_period_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentPeriodDiscountPayment extends GetWidget<RentPeriodController> {
  const RentPeriodDiscountPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPrimaryText(
          text: 'How would you like to pay?',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.darkTextColor,
        ),
        SizedBox(height: 28.h),
        ...List.generate(controller.payment.length, (index) {
          return Row(
            children: [
              Obx(
                () => CustomRadioButton(
                  value: index,
                  groupValue: controller.selectedPayment.value,
                  onChange: (value) {
                    controller.selectedPayment.value = value!;
                  },
                ),
              ),
              CustomPrimaryText(
                text: controller.payment[index],
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.titleTextColor,
              ),
            ],
          );
        }),
        SizedBox(height: 28.h),
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            border: Border.all(width: 1.r, color: Color(0xFF38C793)),
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: 'Installment Schedule (Breakdown)',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.labelColor,
              ),
              SizedBox(height: 15.h),
              ...List.generate(controller.installment.length, (index) {
                final item = controller.installment[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPrimaryText(
                      text: item['title'],
                      fontSize: 14.sp,
                      color: AppColors.labelColor,
                    ),
                    SizedBox(height: 8.h),
                    CustomPrimaryText(
                      text: item['subTitle'],
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyTextColor,
                    ),
                    SizedBox(
                      height: controller.installment.length - 1 == index
                          ? 0
                          : 15.h,
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
