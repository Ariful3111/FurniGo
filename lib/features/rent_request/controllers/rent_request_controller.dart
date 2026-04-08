import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/data/local/storage_service.dart';
import 'package:zb_dezign/features/profile/controllers/profile_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/features/rent_request/repositories/step_zero_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class RentRequestController extends GetxController {
  final StepZeroRepository stepZeroRepository;
  RentRequestController({required this.stepZeroRepository});
  TextEditingController businessNameController = TextEditingController();
  TextEditingController personNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController abnController = TextEditingController();
  TextEditingController businessSiteController = TextEditingController();
  ScrollController rentController = ScrollController();
  final formKey = GlobalKey<FormState>();
  final user = Get.find<ProfileController>().userProfile.value?.data;
  final storage = Get.find<StorageService>();

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
  Future<void> submitRentRequestZero() async {
    
    if (formKey.currentState?.validate() == true) {
      final response = await stepZeroRepository.execute(
        businessName: businessNameController.text,
        contactPerson: personNameController.text,
        email: emailController.text,
        phone: phoneController.text,
        abn: abnController.text,
        website: businessSiteController.text,
      );
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) async {
          Get.find<RentStepController>().currentIndex.value++;

          await storage.write(key: storage.rentRequestUUID, value: data.uuid);
        },
      );
    }
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
