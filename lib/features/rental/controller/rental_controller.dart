import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentalController extends GetxController {
  List<String> statusList = ['All', 'Active', 'Pending', 'Quoted', 'Completed'];
  RxInt statusIndex = 0.obs;
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
