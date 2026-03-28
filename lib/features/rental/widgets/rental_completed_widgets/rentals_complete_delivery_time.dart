import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/other_field.dart';
import 'package:zb_dezign/features/rental/controllers/rentals_complete_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsCompleteDeliveryTime extends GetWidget<RentalsCompleteController> {
  const RentalsCompleteDeliveryTime({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Preferred Time Period',
            fontSize: 14.sp,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 12.h),
          ...List.generate(controller.timeIndex.length, (index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: controller.timeIndex.length - 1 == index ? 0 : 12.h,
              ),
              child: Column(
                children: List.generate(controller.time.length, (i) {
                  return Row(
                    children: [
                      CustomRadioButton(
                        value: i,
                        groupValue: controller.timeIndex[index],
                        onChange: (value) {
                          controller.timeIndex[index] = i;
                          controller.timeIndex.refresh();
                        },
                      ),
                      controller.time[i] == 'Other'
                          ? Container(
                              height: 36.h,
                              width: 251.w,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 2,
                                    color: Color(
                                      0xFFE4E5E7,
                                    ).withValues(alpha: 0.24),
                                  ),
                                ],
                              ),
                              child: OtherField(
                                controller: controller.otherController,
                                readOnly: controller.timeIndex[index] == 3
                                    ? false
                                    : true,
                              ),
                            )
                          : CustomPrimaryText(
                              text: controller.time[i],
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: isDark
                                  ? AppColors.whiteColor
                                  : AppColors.darkColor,
                            ),
                    ],
                  );
                }),
              ),
            );
          }),
          SizedBox(height: 15.h),
          GestureDetector(
            onTap: () {
              controller.timeIndex.add(0);
            },
            child: Container(
              height: 40.h,
              width: 79.w,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkColor : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(
                  width: 1.r,
                  color: isDark
                      ? AppColors.darkBorderColor
                      : AppColors.buttonBorderColor,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, fontWeight: FontWeight.w900, size: 16.sp),
                  SizedBox(width: 4.w),
                  CustomPrimaryText(
                    text: 'Date',
                    fontSize: 12.sp,
                    color: isDark ? AppColors.whiteColor : AppColors.labelColor,
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
