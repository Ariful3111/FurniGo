import 'package:get/get_rx/src/rx_types/rx_types.dart';

class RentApplianceModel {
  final RxList<bool> isChecked;
  final String appliances;
  final RxList<int> counts;
  final RxList<String> applianceItems;
  RentApplianceModel({
    required this.appliances,
    required List<String> initialApplianceItems,
  }):applianceItems = List<String>.from(initialApplianceItems).obs,
        counts = List<int>.filled(initialApplianceItems.length, 0).obs,
        isChecked = List<bool>.filled(initialApplianceItems.length, false).obs;
}
