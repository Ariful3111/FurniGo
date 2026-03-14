import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportController extends GetxController{
  final subjectController = TextEditingController();
  final orderIdController = TextEditingController();
  final messageController = TextEditingController();

  RxString selectedCategory = ''.obs;

  List<String> categories = [
    "Payment Issue",
    "Order Problem",
    "Delivery Issue",
    "Technical Issue",
  ];
}