import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_appliance_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_add_button.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/property_details_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentApplianceWidgetsDetails extends GetWidget<RentApplianceController> {
  const RentApplianceWidgetsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        CustomPrimaryText(
          text: 'Selected Appliance:',
          fontSize: 14.sp,
          color: AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        ...List.generate(controller.appliance.length, (index) {
          return Obx(()=> Padding(
           padding: EdgeInsets.only(
                bottom: controller.appliance.length - 1 == index
                    ? 0.h
                    : 13.h,
              ),
            child: PropertyDetailsContainer(
              subTitle: 'Quantity',
              isChecked: controller.isSelect[index],
              onChange: (value) {
                controller.isSelect[index] = value!;
              },
              title: controller.appliance[index],
              onAdd: () {
                controller.count[index]++;
              },
              onRemoved: () {
                if (controller.count[index] > 0) {
                  controller.count[index]--;
                }
              },
              count: controller.count[index].toString(),
              isOther: controller.appliance[index] == 'other',
              otherController: controller.otherFieldController,
              readOnly: controller.isSelect[index],
            ),
          ),);
        }),
        SizedBox(height: 16.h,),
        PropertyAddButton(text: 'Add More', onTap: () {
          
        },),
      ],
    );
  }
}
