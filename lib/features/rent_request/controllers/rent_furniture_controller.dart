import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_details_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/features/rent_request/models/rent_furniture_model.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class RentFurnitureController extends GetxController {
  final RentPropertyDetailsController propertyController =
      Get.find<RentPropertyDetailsController>();

  RxList<bool> isOpenList = <bool>[].obs;
  TextEditingController itemController = TextEditingController();

  RxList<String> furniture = <String>[
    'Bed',
    'Chair',
    'Sofa',
    'Table',
    'Side Table',
    'Wardrobe',
    'Lamps',
    'Tv Unit',
  ].obs;
  List stylePreference = ['Modern', 'Minimal', 'Luxury', 'Neutral', 'Custom'];
  List preference = ['New Items', 'Refurbished Items', 'Mix of Both'];
  RxList<RentFurnitureModel> groups = <RentFurnitureModel>[].obs;
  @override
  void onInit() {
    super.onInit();
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
  }

  void addFurnitureItemToModel(RentFurnitureModel model, String item) {
    final value = item.trim();
    if (value.isEmpty) {
      ErrorSnackbar.show(description: 'Please enter item name');
      return;
    }
    model.furnitureItems.add(value);
    model.counts.add(0);
    model.isChecked.add(false);
    if (!furniture.contains(value)) {
      furniture.add(value);
    }
  }

  void removeFurnitureItemFromModel(RentFurnitureModel model, int index) {
    if (index < 0 || index >= model.furnitureItems.length) {
      return;
    }
    model.furnitureItems.removeAt(index);
    if (index < model.counts.length) {
      model.counts.removeAt(index);
    }
    if (index < model.isChecked.length) {
      model.isChecked.removeAt(index);
    }
  }

  void getDataFromProperty() {
    groups.clear();
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
        groups.add(
          RentFurnitureModel(
            title: label,
            initialFurnitureItems: furniture,
            stylePreferenceLength: stylePreference.length,
          ),
        );
        isOpenList.add(false);
      }
    }
  }

  List<Map<String, dynamic>> get formattedFurnitureData {
    List<Map<String, dynamic>> result = [];

    for (var group in groups) {
      List<String> checkedItems = [];
      for (int i = 0; i < group.furnitureItems.length; i++) {
        if (group.isChecked[i] && group.counts[i] > 0) {
          checkedItems.add('${group.furnitureItems[i]} (${group.counts[i]})');
        }
      }

      if (checkedItems.isNotEmpty) {
        // Get selected condition preference
        String conditionPreference =
            preference[group.selectedPreference.value] ?? 'Not specified';

        // Get selected style preferences
        List<String> selectedStyles = [];
        for (int i = 0; i < group.checkedPreference.length; i++) {
          if (group.checkedPreference[i]) {
            selectedStyles.add(stylePreference[i]);
          }
        }
        String styleText = selectedStyles.isNotEmpty
            ? selectedStyles.join(', ')
            : 'Not specified';

        String value =
            '${checkedItems.join(', ')} | Condition: $conditionPreference | Style: $styleText';

        result.add({'title': group.title, 'value': value});
      }
    }

    return result;
  }

  Future<void> submitRentRequestFour() async {
    Get.find<RentRequestController>().rentController.position.minScrollExtent;

    Get.find<RentStepController>().currentIndex.value++;
  }

  @override
  void dispose() {
    itemController.dispose();
    super.dispose();
  }
}
