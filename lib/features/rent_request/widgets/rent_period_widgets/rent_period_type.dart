import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_period_controller.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_period_widgets/rent_period_type_budget.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentPeriodType extends GetWidget<RentPeriodController> {
  const RentPeriodType({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Special Requests / Constraints',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: isDark? AppColors.whiteColor: AppColors.titleTextColor,
          ),
          SizedBox(height: 12.h),
          CustomPrimaryText(
            text: 'Timeline Urgency',
            fontSize: 14.sp,
            color: isDark? AppColors.whiteColor: AppColors.titleTextColor,
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(controller.type.length, (index) {
              return Row(
                children: [
                  Obx(
                    () => CustomRadioButton(
                      value: index,
                      groupValue: controller.selectedType.value,
                      onChange: (value) {
                        controller.selectedType.value = value!;
                      },
                    ),
                  ),
                  CustomPrimaryText(
                    text: controller.type[index],
                    fontSize: 14.sp,
                    color: isDark? AppColors.whiteColor: AppColors.darkColor,
                  ),
                ],
              );
            }),
          ),
          SizedBox(height: 24.h),
          RentPeriodTypeBudget(),
        ],
      ),
    );
  }
}
