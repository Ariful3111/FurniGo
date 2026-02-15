import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_appliance_widgets/rent_appliance_widgets_details.dart';

class RentApplianceController extends GetxController {
  TextEditingController otherFieldController = TextEditingController();

  RxBool isAppliance = false.obs;
  RxList<bool> isOpenList = <bool>[].obs;
  List widgets = [
    {'title': 'Reception', 'child': RentApplianceWidgetsDetails()},
    {'title': 'Private Offices', 'child': RentApplianceWidgetsDetails()},
    {'title': 'Showroom', 'child': RentApplianceWidgetsDetails()},
  ];
  List appliance = [
    'Refrigerator',
    'Microwave',
    'Washing Machine',
    'Dryer',
    'Kettle / Toaster',
    'Television',
    'other',
  ];
  RxList<bool> isSelect = <bool>[].obs;
  RxList<int> count = <int>[].obs;
  @override
  void onInit() {
    isOpenList.value = List.generate(widgets.length, (_) => false);
    isSelect.assignAll(List.generate(appliance.length, (_) => false));
    count.assignAll(List.generate(appliance.length, (_) => 0));
    super.onInit();
  }

  @override
  void dispose() {
    otherFieldController.dispose();
    super.dispose();
  }
}
