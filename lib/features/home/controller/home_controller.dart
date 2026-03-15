import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt colorIndex = 0.obs;
  RxInt productIndex = 0.obs;
  RxDouble position = 0.5.obs;

  void updatePosition(double dx, double width) {
    double value = (dx / width).clamp(0.0, 1.0);
    position.value = value;
  }
}
