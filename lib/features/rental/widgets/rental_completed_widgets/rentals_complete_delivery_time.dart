import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/other_field.dart';
import 'package:zb_dezign/features/rental/controller/rentals_complete_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsCompleteDeliveryTime extends StatelessWidget {
  const RentalsCompleteDeliveryTime({super.key});

  @override
  Widget build(BuildContext context) {
    RentalsCompleteController completeController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Preferred Time Period',
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 12.h),
        ...List.generate(completeController.time.length, (i) {
          return Obx(
            () => Row(
              children: [
                CustomRadioButton(
                  value: i,
                  groupValue: completeController.timeIndex.value,
                  onChange: (value) {
                    completeController.timeIndex.value = i;
                  },
                ),
                completeController.time[i] == 'Other'
                    ? Container(
                        height: 36.h,
                        width: 251.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 2,
                              color: Color(0xFFE4E5E7).withValues(alpha: 0.24),
                            ),
                          ],
                        ),
                        child: OtherField(
                          controller: completeController.otherController,
                          readOnly: completeController.timeIndex.value == 3
                              ? false
                              : true,
                        ),
                      )
                    : CustomPrimaryText(
                        text: completeController.time[i],
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.darkColor,
                      ),
              ],
            ),
          );
        }),
        SizedBox(height: 15.h),
        GestureDetector(
          onTap: () {},
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
    );
  }
}
