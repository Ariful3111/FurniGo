import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/data/local/storage_service.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/controller/user_mode_controller.dart';
import 'package:zb_dezign/features/auth/repositories/register_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';
import 'package:zb_dezign/shared/widgets/snackbars/success_snackbar.dart';

class SignupController extends GetxController {
  final RegisterRepository registerRepository;

  SignupController({required this.registerRepository});

  RxBool isChecked = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController abnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxBool isLoading = false.obs;
  final storage = Get.find<StorageService>();

  Future<void> register({required GlobalKey<FormState> formKey}) async {
    
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;

      final response = await registerRepository.execute(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        abn: abnController.text.isNotEmpty ? abnController.text : "", userType: Get.find<UserModeController>().selectedIndex.value==0?'customer':'business',
      );
      isLoading.value = false;
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message.toString());
        },
        (data) async {
          await storage.write(
            key: storage.tokenKey,
            value: data.token.toString(),
          );
          SuccessSnackbar.show(description: 'Registration Successful');
          Get.toNamed(AppRoutes.rentBusinessIdentification);
        },
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    abnController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
