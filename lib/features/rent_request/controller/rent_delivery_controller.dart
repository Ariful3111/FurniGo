import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentDeliveryController extends GetxController {
  TextEditingController deliveryAddressController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController deliveryDateController = TextEditingController();
  TextEditingController otherDateController = TextEditingController();
  RxBool isChecked = false.obs;
  RxBool isSetup = false.obs;
  List<String> city = ['City 1', 'City 2', 'City 3'];
  RxString selectedCity = 'Select'.obs;
  List<String> state = ['State 1', 'State 2', 'State 3'];
  RxString selectedState = 'Select'.obs;
  List<String> timePeriod = [
    'Between 8 a.m. - 12 p.m.',
    'Between 12 p.m. - 5 p.m.',
    'After 5 p.m.',
    'other',
  ];
  RxInt selectedTimePeriod = 0.obs;
  RxInt isLoading = 0.obs;
  RxInt isLift = 0.obs;
  RxInt isRestriction = 0.obs;
  List access = [
    {
      'Option': ['Yes', 'No'],
      'title': 'Loading Dock Available? *',
      'selectedOption': 0.obs,
    },
    {
      'Option': ['Yes', 'No'],
      'title': 'Lift Access Available? *',
      'selectedOption': 0.obs,
    },
    {
      'Option': ['Yes', 'No'],
      'title': 'Working hours restrictions',
      'selectedOption': 0.obs,
    },
  ];
  @override
  void dispose() {
    deliveryAddressController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    zipController.dispose();
    deliveryDateController.dispose();
    otherDateController.dispose();
    super.dispose();
  }
}
