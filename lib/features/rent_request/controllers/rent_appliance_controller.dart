import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_details_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/features/rent_request/models/rent_appliance_model.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class RentApplianceController extends GetxController {
  final RentPropertyDetailsController propertyController =
      Get.find<RentPropertyDetailsController>();
  TextEditingController itemController = TextEditingController();
  RxBool isAppliance = false.obs;
  RxList<bool> isOpenList = <bool>[].obs;
  RxList<RentApplianceModel> item = <RentApplianceModel>[].obs;
  RxList<String> appliance = <String>[
    'Refrigerator',
    'Microwave',
    'Washing Machine',
    'Dryer',
    'Kettle / Toaster',
    'Television',
    'Television',
    'Air Purifier',
    'Heater',
  ].obs;
  RxList<bool> isSelect = <bool>[].obs;
  RxList<int> count = <int>[].obs;
  @override
  void onInit() {
    getDataFromProperty();
    ever<List<String>>(propertyController.spaceBreakdown, (_) {
      getDataFromProperty();
    });
    ever<List<bool>>(propertyController.isChecked, (_) {
      getDataFromProperty();
    });
    ever<List<int>>(propertyController.counts, (_) {
      getDataFromProperty();
    });
    isSelect.assignAll(List.generate(item.length, (_) => false));
    count.assignAll(List.generate(item.length, (_) => 0));
    super.onInit();
  }

  Future<void> submitRentRequestFive() async {
    Get.find<RentRequestController>().rentController.position.minScrollExtent;
    Get.find<RentStepController>().currentIndex.value++;
    
  }

  void addApplianceItemToModel(RentApplianceModel model, String item) {
    final value = item.trim();
    if (value.isEmpty) {
      ErrorSnackbar.show(description: 'Please enter item name');
      return;
    }
    model.applianceItems.add(value);
    model.counts.add(0);
    model.isChecked.add(false);
    if (!appliance.contains(value)) {
      appliance.add(value);
    }
  }

  void removeApplianceItemFromModel(RentApplianceModel model, int index) {
    if (index < 0 || index >= model.applianceItems.length) {
      return;
    }
    model.applianceItems.removeAt(index);
    if (index < model.counts.length) {
      model.counts.removeAt(index);
    }
    if (index < model.isChecked.length) {
      model.isChecked.removeAt(index);
    }
  }

  void getDataFromProperty() {
    item.clear();
    isOpenList.clear();
    final labels = propertyController.spaceBreakdown;
    final checks = propertyController.isChecked;
    final counts = propertyController.counts;

    for (var i = 0; i < labels.length; i++) {
      final bool selected = i < checks.length ? checks[i] : false;
      final int count = i < counts.length ? counts[i] : 0;
      if (!selected || count <= 0) {
        continue;
      }
      final base = labels[i];
      for (var j = 0; j < count; j++) {
        final label = '$base${(j + 1).toString().padLeft(2, '0')}';
        item.add(
          RentApplianceModel(
            appliances: label,
            initialApplianceItems: appliance,
          ),
        );
        isOpenList.add(false);
      }
    }
  }

  @override
  void dispose() {
    itemController.dispose();
    super.dispose();
  }
}
