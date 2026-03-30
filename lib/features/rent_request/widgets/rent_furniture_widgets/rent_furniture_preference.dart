import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_furniture_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentFurniturePreference extends GetWidget<RentFurnitureController> {
  const RentFurniturePreference({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.builder(
          itemCount: controller.preference.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 5,
          ),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Obx(
                  () => CustomRadioButton(
                    value: index,
                    groupValue: controller.selectedPreference.value,
                    onChange: (value) {
                      controller.selectedPreference.value = value!;
                    },
                  ),
                ),
                Expanded(
                  child: CustomPrimaryText(
                    text: controller.preference[index],
                    fontSize: 14.sp,
                    color: AppColors.darkColor,
                    fontWeight: FontWeight.w400,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          },
        ),
        SizedBox(height: 20.h),
        CustomPrimaryText(
          text: 'Style Preference:',
          fontSize: 14.sp,
          color: AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          itemCount: controller.stylePreference.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12.h,
            crossAxisSpacing: 12.w,
            childAspectRatio: 2.5,
          ),
          itemBuilder: (context, index) {
            return Obx(
              () => RentHelper.propertyCheckBox(
                context: context,
                isLastIndex: controller.stylePreference.length - 1 == index,
                isChecked: controller.checkedPreference[index],
                onChange: (value) {
                  controller.checkedPreference[index] = value!;
                },
                title: controller.stylePreference[index],
              ),
            );
          },
        ),
      ],
    );
  }
}
