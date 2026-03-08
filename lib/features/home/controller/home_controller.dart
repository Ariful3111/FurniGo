import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt colorIndex = 0.obs;
  RxInt productIndex = 0.obs;
}
