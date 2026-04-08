import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloorPlanItem {
  final String title;
  final TextEditingController lengthController;
  final TextEditingController widthController;
  final RxString imagePath;

  FloorPlanItem({required this.title})
    : lengthController = TextEditingController(text: '1'),
      widthController = TextEditingController(text: '2'),
      imagePath = ''.obs;

  void dispose() {
    lengthController.dispose();
    widthController.dispose();
  }
}