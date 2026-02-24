import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentalsCompleteController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  RxInt timeIndex = 0.obs;
  bool deliveryStatus = true;
  List time = [
    'Between 8 a.m. - 12 p.m.',
    'Between 12 p.m. - 5 p.m.',
    'After 5 p.m.',
    'Other',
  ];
  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }
}
