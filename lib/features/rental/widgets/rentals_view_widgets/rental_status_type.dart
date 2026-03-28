import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_filter.dart';

class RentalStatusType extends GetWidget<RentalController> {
  const RentalStatusType({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomTableFilter(
        onTap: (value) {
          controller.onStatusChanged(index: value);
        },
        item: controller.statusList,
        selectedIndex: controller.statusIndex.value,
      ),
    );
  }
}
