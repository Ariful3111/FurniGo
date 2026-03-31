import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_furniture_widgets/rent_furniture_details.dart';

class RentFurnitureController extends GetxController {
  RxList<bool> isOpenList = <bool>[].obs;
  List widgets = [
    {'title': 'Office', 'child': RentFurnitureDetails()},
    {'title': 'Kitchen', 'child': RentFurnitureDetails()},
    {'title': 'Showroom', 'child': RentFurnitureDetails()},
  ];
  TextEditingController otherFieldController = TextEditingController();
  List furniture = [
    'Bedrooms',
    'Bathrooms',
    'Car Spaces',
    'Living Rooms',
    'Kitchens',
    'other',
  ];
  List stylePreference = ['Modern', 'Minimal', 'Luxury', 'Neutral', 'Custom'];
  List preference = ['New Items', 'Refurbished Items', 'Mix of Both'];
  RxInt selectedPreference = 0.obs;
  final RxList<int> counts = <int>[].obs;
  RxList<bool> isChecked = <bool>[].obs;
  RxList<bool> checkedPreference = <bool>[].obs;
  @override
  void onInit() {
    isChecked.assignAll(List.generate(furniture.length, (_) => false));
    checkedPreference.assignAll(
      List.generate(stylePreference.length, (_) => false),
    );
    counts.assignAll(List.generate(furniture.length, (_) => 0));
    isOpenList.value = List.generate(widgets.length, (_) => false);
    super.onInit();
  }

  @override
  void dispose() {
    otherFieldController.dispose();
    super.dispose();
  }
}
