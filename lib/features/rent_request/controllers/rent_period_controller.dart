import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentPeriodController extends GetxController {
  RxInt selectedPayment = 0.obs;
  TextEditingController otherController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController requirementController = TextEditingController();
  RxBool isSelected = false.obs;
  RxBool isSearchFocus = false.obs;
  TextEditingController searchController = TextEditingController();
  TextEditingController customController = TextEditingController();
  RxString selectedRentPeriodTitle = ''.obs;
  final FocusNode rentDurationFocusNode = FocusNode();
  List<Map<String, String>> rentPeriodList = <Map<String, String>>[
    {'title': '30 Days', 'subTitle': 'Minimum Duration'},
    {'title': '60 Days', 'subTitle': '3% OFF'},
    {'title': '90 Days', 'subTitle': '7% OFF'},
    {'title': '6 Month', 'subTitle': '16% OFF'},
    {'title': '12 Month', 'subTitle': '48% OFF'},
    {'title': 'custom'},
  ];
  RxInt selectedType = 0.obs;
  RxInt selectedOption = 0.obs;
  List payment = ['Pay in full', 'Pay in instalment'];
  List type = ['Urgent', 'Standard', 'Flexible'];
  List option = ['Yes', 'No'];
  List installment = [
    {
      'title': 'Upfront Payment (40%)',
      'subTitle': 'A portion of the total amount is charged at checkout.',
    },
    {
      'title': '2nd Payment (Month 2 - 30%)',
      'subTitle': 'Automatically charged in the following billing period.',
    },
    {
      'title': 'Final Payment (Month 3 - 30%)',
      'subTitle': 'Charged in the last billing period of the plan.',
    },
  ];

  @override
  void dispose() {
    otherController.dispose();
    weightController.dispose();
    requirementController.dispose();
    searchController.dispose();
    customController.dispose();
    rentDurationFocusNode.dispose();
    super.dispose();
  }
}
