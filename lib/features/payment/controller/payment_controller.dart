import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController bsbController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController cardController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  RxBool isEdit = false.obs;
  @override
  void onClose() {
    nameController.dispose();
    bsbController.dispose();
    accountController.dispose();
    cardController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.onClose();
  }
}
