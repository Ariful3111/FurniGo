import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_appliance_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_add_button.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/property_details_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentApplianceWidgetsDetails extends StatelessWidget {
  const RentApplianceWidgetsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    RentApplianceController rentApplianceController = Get.find();
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
        ...List.generate(rentApplianceController.appliance.length, (index) {
          return Obx(()=> Padding(
           padding: EdgeInsets.only(
                bottom: rentApplianceController.appliance.length - 1 == index
                    ? 0.h
                    : 13.h,
              ),
            child: PropertyDetailsContainer(
              subTitle: 'Quantity',
              isChecked: rentApplianceController.isSelect[index],
              onChange: (value) {
                rentApplianceController.isSelect[index] = value!;
              },
              title: rentApplianceController.appliance[index],
              onAdd: () {
                rentApplianceController.count[index]++;
              },
              onRemoved: () {
                if (rentApplianceController.count[index] > 0) {
                  rentApplianceController.count[index]--;
                }
              },
              count: rentApplianceController.count[index].toString(),
              isOther: rentApplianceController.appliance[index] == 'other',
              otherController: rentApplianceController.otherFieldController,
              readOnly: rentApplianceController.isSelect[index],
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
