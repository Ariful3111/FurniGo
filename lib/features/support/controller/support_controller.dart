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

  List<Map<String, dynamic>> tickets = [
    {
      "title": "Delivery Delayed for Sofa",
      "id": "#TKT-9921",
      "time": "Updated 2 hours ago",
      "status": "Open"
    },
    {
      "title": "Change of Address",
      "id": "#TKT-8822",
      "time": "Updated 3 days ago",
      "status": "Resolved"
    },
  ];
}