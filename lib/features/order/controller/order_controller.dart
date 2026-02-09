import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  TextEditingController orderController = TextEditingController();
  RxBool isSearch = false.obs;

  @override
  void dispose() {
    orderController.dispose();
    super.dispose();
  }
}