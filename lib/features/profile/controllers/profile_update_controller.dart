import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/profile/controllers/profile_controller.dart';

class ProfileUpdateController extends GetxController {
  final profile = Get.find<ProfileController>().userProfile.value;
  RxBool isEdit = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController.text = profile?.data?.name ?? '';
    emailController.text = profile?.data?.email ?? '';
    phoneController.text = profile?.data?.phone ?? '';
  }

  @override
  dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
