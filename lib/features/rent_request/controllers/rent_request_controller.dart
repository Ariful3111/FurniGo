import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/profile/controllers/profile_controller.dart';

class RentRequestController extends GetxController {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController personNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController abnController = TextEditingController();
  TextEditingController businessSiteController = TextEditingController();
  ScrollController rentController = ScrollController();
  final formKey = GlobalKey<FormState>();
  final user = Get.find<ProfileController>().userProfile.value?.data;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  void initializeData() {
    personNameController.text = user?.name ?? '';
    emailController.text = user?.email ?? '';
    phoneController.text = user?.phone ?? '';
    abnController.text = user?.abn ?? '';
  }

  @override
  void dispose() {
    businessNameController.dispose();
    personNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    abnController.dispose();
    businessSiteController.dispose();
    super.dispose();
  }
}
