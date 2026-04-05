import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class RentPropertyDetailsController extends GetxController {
  TextEditingController propertyAddressController = TextEditingController();
  TextEditingController propertySizeController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  RxList<String> spaceBreakdown = <String>[
    'Bedrooms',
    'Bathrooms',
    'Car Spaces',
    'Living Rooms',
    'Kitchens',
  ].obs;
  RxList<int> counts = <int>[].obs;
  RxList<bool> isChecked = <bool>[].obs;

  @override
  void onInit() {
    isChecked.assignAll(List.generate(spaceBreakdown.length, (_) => false));
    counts.assignAll(List.generate(spaceBreakdown.length, (_) => 0));
    super.onInit();
  }

  String get formattedSpaceBreakdown {
    List<String> result = [];

    for (int i = 0; i < spaceBreakdown.length; i++) {
      if (isChecked[i] && counts[i] > 0) {
        result.add('${spaceBreakdown[i]} (${counts[i]})');
      }
    }

    return result.join(', ');
  }

  void addSpaceBreakdownItem(String item) {
    final value = item.trim();
    if (value.isEmpty) {
      ErrorSnackbar.show(description: 'Please enter item name');
      return;
    }
    spaceBreakdown.add(value);
    counts.add(0);
    isChecked.add(false);
  }

  void removeSpaceBreakdownAt(int index) {
    if (index < 0 || index >= spaceBreakdown.length) {
      return;
    }
    spaceBreakdown.removeAt(index);
    if (index < counts.length) {
      counts.removeAt(index);
    }
    if (index < isChecked.length) {
      isChecked.removeAt(index);
    }
  }

  RentRequestController controller = Get.find();
  Future<void> submitRentRequestTwo() async {
    if (propertyAddressController.text.isEmpty ||
        propertySizeController.text.isEmpty) {
      ErrorSnackbar.show(description: 'Please fill all the fields');
    } else if (!isChecked.contains(true)) {
      ErrorSnackbar.show(description: 'Please Select A Item');
    } else if (counts.every((c) => c == 0)) {
      ErrorSnackbar.show(description: 'Please add quantity');
    } else {
      controller.rentController.animateTo(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
        controller.rentController.position.minScrollExtent,
      );

      Get.find<RentStepController>().currentIndex.value++;
    }
  }

  @override
  void dispose() {
    propertyAddressController.dispose();
    propertySizeController.dispose();
    itemController.dispose();
    super.dispose();
  }
}
