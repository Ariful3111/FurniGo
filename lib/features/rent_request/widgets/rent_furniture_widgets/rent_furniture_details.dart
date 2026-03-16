import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_furniture_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_add_button.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/property_details_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_furniture_widgets/rent_furniture_preference.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentFurnitureDetails extends GetWidget<RentFurnitureController> {
  const RentFurnitureDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(controller.furniture.length, (index) {
          return Obx(() {
            return Padding(
              padding: EdgeInsets.only(
                bottom: controller.furniture.length - 1 == index
                    ? 0.h
                    : 13.h,
              ),
              child: PropertyDetailsContainer(
                subTitle: 'Quantity',
                isChecked: controller.isChecked[index],
                onChange: (value) {
                  controller.isChecked[index] = value!;
                },
                title: controller.furniture[index],
                onAdd: () {
                  controller.counts[index]++;
                },
                onRemoved: () {
                  if (controller.counts[index] > 0) {
                    controller.counts[index]--;
                  }
                },
                count: controller.counts[index].toString(),
                isOther: controller.furniture[index] == 'other',
                otherController: controller.otherFieldController,
                readOnly: controller.isChecked[index],
              ),
            );
          });
        }),
        SizedBox(height: 16.h),
        PropertyAddButton(text: 'Add More', onTap: () {}),
        SizedBox(height: 20.h),
        CustomPrimaryText(
          text: 'Preference:',
          fontSize: 14.sp,
          color: AppColors.darkColor,
        ),
        SizedBox(height: 12.h,),
        RentFurniturePreference()
      ],
    );
  }
}
