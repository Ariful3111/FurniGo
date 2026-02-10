import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/data/local/storage_service.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/repositories/login_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';
import 'package:zb_dezign/shared/widgets/snackbars/success_snackbar.dart';

class SigninController extends GetxController {
  final LoginRepository loginRepository;
  SigninController({required this.loginRepository});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isLoading = false.obs;
  final storage = Get.find<StorageService>();

  Future<void> userLogin({required GlobalKey<FormState> formKey}) async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      final response = await loginRepository.execute(
        email: email.text,
        password: password.text,
      );
      isLoading.value = false;
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message.toString());
        },
        (data) async {
          await storage.write(key: storage.tokenKey, value: data.token);
          SuccessSnackbar.show(description: 'Login Successful');
        },
      );
    }
  }

  void signup({required GlobalKey<FormState> formKey}) {
    email.clear();
    password.clear();
    formKey.currentState?.reset();
    Get.toNamed(AppRoutes.userModeView);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
