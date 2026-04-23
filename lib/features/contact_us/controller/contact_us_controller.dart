import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  RxList<int> openedIndexes = <int>[].obs;

  void toggle(int index) {
    if (openedIndexes.contains(index)) {
      openedIndexes.remove(index);
    } else {
      openedIndexes.add(index);
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }
}
