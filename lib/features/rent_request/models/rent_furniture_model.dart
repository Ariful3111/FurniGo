import 'package:get/get.dart';

class RentFurnitureModel {
  final String title;
  final RxList<String> furnitureItems;
  final RxList<int> counts;
  final RxList<bool> isChecked;
  final RxList<bool> checkedPreference;
  final RxInt selectedPreference;

  RentFurnitureModel({
    required this.title,
    required List<String> initialFurnitureItems,
    required int stylePreferenceLength,
  })  : furnitureItems = List<String>.from(initialFurnitureItems).obs,
        counts = List<int>.filled(initialFurnitureItems.length, 0).obs,
        isChecked = List<bool>.filled(initialFurnitureItems.length, false).obs,
        checkedPreference =
            List<bool>.filled(stylePreferenceLength, false).obs,
        selectedPreference = 0.obs;
}
