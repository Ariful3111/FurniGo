import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/models/floor_plan_model.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_details_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';

class RentFloorPlanController extends GetxController {
  final RentPropertyDetailsController propertyController =
      Get.find<RentPropertyDetailsController>();
  RxBool isShare = false.obs;
  final RxList<FloorPlanItem> items = <FloorPlanItem>[].obs;
  RxList<bool> isOpenList = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    _rebuildFromProperty();
    ever<List<String>>(propertyController.spaceBreakdown, (_) {
      _rebuildFromProperty();
    });
    ever<List<bool>>(propertyController.isChecked, (_) {
      _rebuildFromProperty();
    });
    ever<List<int>>(propertyController.counts, (_) {
      _rebuildFromProperty();
    });
  }

  void _rebuildFromProperty() {
    for (final item in items) {
      item.dispose();
    }
    items.clear();
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
        final label = '$base${(j + 1).toString().padLeft(2, ' 0')}';
        items.add(FloorPlanItem(title: label));
        isOpenList.add(false);
      }
    }
  }

  void setItemImage(int index, String path) {
    if (index < 0 || index >= items.length) {
      return;
    }
    items[index].imagePath.value = path;
  }

  void clearItemImage(int index) {
    if (index < 0 || index >= items.length) {
      return;
    }
    items[index].imagePath.value = '';
  }

  RentRequestController controller = Get.find();
  Future<void> submitRentRequestThree() async {
    controller.rentController.animateTo(
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
      controller.rentController.position.minScrollExtent,
    );
    Get.find<RentStepController>().currentIndex.value++;
  }

  List<Map<String, dynamic>> get formattedFloorPlanDetails {
    List<Map<String, dynamic>> result = [];

    for (var item in items) {
      String length = item.lengthController.text;
      String width = item.widthController.text;
      result.add({
        'title': item.title,
        'value': 'Length ($length) x Width ($width)',
      });
    }

    return result;
  }

  @override
  void dispose() {
    for (final item in items) {
      item.dispose();
    }
    super.dispose();
  }
}
