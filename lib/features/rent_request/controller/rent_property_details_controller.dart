import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentPropertyDetailsController extends GetxController {
  TextEditingController propertyAddressController = TextEditingController();
  TextEditingController propertySizeController = TextEditingController();
  TextEditingController otherFieldController = TextEditingController();
  List spaceBreakdown = [
    'Bedrooms',
    'Bathrooms',
    'Car Spaces',
    'Living Rooms',
    'Kitchens',
    'other'
  ];
  final RxList<int> counts = <int>[].obs;
  RxList<bool> isChecked = <bool>[].obs;
  @override
  void onInit() {
    isChecked.assignAll(List.generate(spaceBreakdown.length, (_) => false));
    counts.assignAll(List.generate(spaceBreakdown.length, (_) => 0));
    super.onInit();
  }
  @override
  void dispose() {
    propertyAddressController.dispose();
    propertySizeController.dispose();
    otherFieldController.dispose();
    super.dispose();
  }
}
