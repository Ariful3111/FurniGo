import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_floor_plan_widgets/office_floor.dart';

class RentFloorPlanController extends GetxController {
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  RxBool isShare = false.obs;
  RxList<bool> isOpenList = <bool>[].obs;
  List widgets = [
    {'title': 'Office', 'child': OfficeFloor()},
    {'title': 'Kitchen', 'child': OfficeFloor()},
    {'title': 'Showroom', 'child': OfficeFloor()},
  ];

  @override
  void onInit() {
    isOpenList.value = List.generate(widgets.length, (_) => false);
    super.onInit();
  }

  @override
  void dispose() {
    lengthController.dispose();
    widthController.dispose();
    super.dispose();
  }
}
