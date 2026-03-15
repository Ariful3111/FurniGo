import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_furniture_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_add_button.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/property_details_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_furniture_widgets/rent_furniture_preference.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentFurnitureDetails extends StatelessWidget {
  const RentFurnitureDetails({super.key});

  @override
  Widget build(BuildContext context) {
    RentFurnitureController rentFurnitureController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(rentFurnitureController.furniture.length, (index) {
          return Obx(() {
            return Padding(
              padding: EdgeInsets.only(
                bottom: rentFurnitureController.furniture.length - 1 == index
                    ? 0.h
                    : 13.h,
              ),
              child: PropertyDetailsContainer(
                subTitle: 'Quantity',
                isChecked: rentFurnitureController.isChecked[index],
                onChange: (value) {
                  rentFurnitureController.isChecked[index] = value!;
                },
                title: rentFurnitureController.furniture[index],
                onAdd: () {
                  rentFurnitureController.counts[index]++;
                },
                onRemoved: () {
                  if (rentFurnitureController.counts[index] > 0) {
                    rentFurnitureController.counts[index]--;
                  }
                },
                count: rentFurnitureController.counts[index].toString(),
                isOther: rentFurnitureController.furniture[index] == 'other',
                otherController: rentFurnitureController.otherFieldController,
                readOnly: rentFurnitureController.isChecked[index],
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
