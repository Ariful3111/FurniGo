import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';

class RentAdditionalNoteController extends GetxController {
  TextEditingController noteController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  Future<void> submitRentRequestSix() async {
    Get.find<RentRequestController>().rentController.position.minScrollExtent;
    Get.find<RentStepController>().currentIndex.value++;
    
  }
  @override
  void dispose() {
    noteController.dispose();
    brandController.dispose();
    super.dispose();
  }
}
