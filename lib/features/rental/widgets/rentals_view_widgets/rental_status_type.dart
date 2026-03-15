import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controller/rental_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_filter.dart';

class RentalStatusType extends StatelessWidget {
  const RentalStatusType({super.key});

  @override
  Widget build(BuildContext context) {
    RentalController rentalController = Get.find();
    return Obx(
      () => CustomTableFilter(
        onTap: (value) {
          rentalController.statusIndex.value = value;
        },
        item: rentalController.statusList,
        selectedIndex: rentalController.statusIndex.value,
      ),
    );
  }
}
