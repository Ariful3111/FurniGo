import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellFlowDeliveryController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<Map<String, String>> options = [
    {"title": "Home Pickup", "subtitle": "Recommended"},
    {"title": "Self Drop-off", "subtitle": ""},
  ];
  TextEditingController homeDateController = TextEditingController();
  TextEditingController selfDateController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxBool isSaveInfo = false.obs;
  RxList<int> timeIndex = <int>[0].obs;
  RxInt selfSelectedTimeIndex = 0.obs;
  RxInt homeSelectedTimeIndex = 0.obs;

  final List<String> timeSlots = [
    'Between 8 a.m. - 12 p.m.',
    'Between 12 p.m. - 5 p.m.',
    'After 5 p.m.',
    'other',
  ];
  @override
  void dispose() {
    homeDateController.dispose();
    selfDateController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    cityController.dispose();
    zipController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
