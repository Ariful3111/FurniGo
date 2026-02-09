import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_furniture_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentFurniturePreference extends StatelessWidget {
  const RentFurniturePreference({super.key});

  @override
  Widget build(BuildContext context) {
    RentFurnitureController rentFurnitureController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(rentFurnitureController.preference.length, (index) {
          return Row(
            children: [
              Obx(
                () => CustomRadioButton(
                  value: index,
                  groupValue: rentFurnitureController.selectedPreference.value,
                  onChange: (value) {
                    rentFurnitureController.selectedPreference.value = value!;
                  },
                ),
              ),
              CustomPrimaryText(
                text: rentFurnitureController.preference[index],
                fontSize: 14.sp,
                color: AppColors.darkColor,
                fontWeight: FontWeight.w400,
              ),
            ],
          );
        }),
        SizedBox(height: 20.h),
        CustomPrimaryText(
          text: 'Style Preference:',
          fontSize: 14.sp,
          color: AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        ...List.generate(rentFurnitureController.stylePreference.length, (
          index,
        ) {
          return Obx(
            () => propertyCheckBox(
              context: context,
              isLastIndex:
                  rentFurnitureController.stylePreference.length - 1 == index,
              isChecked: rentFurnitureController.isChecked[index],
              onChange: (value) {
                rentFurnitureController.isChecked[index] = value!;
              },
              title: rentFurnitureController.stylePreference[index],
            ),
          );
        }),
      ],
    );
  }
}
