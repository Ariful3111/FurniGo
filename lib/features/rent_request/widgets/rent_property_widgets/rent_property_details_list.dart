import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_details_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_details_container.dart';

class RentPropertyDetailsList extends GetView<RentPropertyDetailsController> {
  const RentPropertyDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: List.generate(controller.spaceBreakdown.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: controller.spaceBreakdown.length - 1 == index
                  ? 0.h
                  : 24.h,
            ),
            child: PropertyDetailsContainer(
              isChecked: controller.isChecked[index],
              onChange: (value) {
                controller.isChecked[index] = value!;
              },
              title: controller.spaceBreakdown[index],
              onAdd: () {
                controller.counts[index]++;
              },
              onRemoved: () {
                if (controller.counts[index] > 0) {
                  controller.counts[index]--;
                }
              },
              count: controller.counts[index].toString(),
              readOnly: controller.isChecked[index],
              onClose: () {
                controller.removeSpaceBreakdownAt(index);
              },
            ),
          );
        }),
      ),
    );
  }
}
