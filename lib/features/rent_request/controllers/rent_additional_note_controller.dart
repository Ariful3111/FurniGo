import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentAdditionalNoteController extends GetxController {
  TextEditingController noteController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  @override
  void dispose() {
    noteController.dispose();
    brandController.dispose();
    super.dispose();
  }
}
