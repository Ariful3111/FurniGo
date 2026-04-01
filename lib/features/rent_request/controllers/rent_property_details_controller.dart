import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  Future<void> submitRentRequestTwo() async {
    if (propertyAddressController.text.isEmpty ||
        propertySizeController.text.isEmpty) {
      ErrorSnackbar.show(description: 'Please fill all the fields');
    } else if (!isChecked.contains(true)) {
      ErrorSnackbar.show(description: 'Please Select A Item');
    } else if (counts.every((c) => c == 0)) {
      ErrorSnackbar.show(description: 'Please add quantity');
    } else {
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
