import 'package:get/get.dart';
import 'package:zb_dezign/features/auth/controller/onboarding_controller.dart';
import 'package:zb_dezign/features/auth/controller/signin_controller.dart';
import 'package:zb_dezign/features/auth/controller/signup_controller.dart';
import 'package:zb_dezign/features/auth/controller/signup_option_controller.dart';
import 'package:zb_dezign/features/auth/controller/user_mode_controller.dart';
import 'package:zb_dezign/features/auth/repositories/login_repo.dart';
import 'package:zb_dezign/features/auth/repositories/register_repo.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
    Get.lazyPut(() => SigninController(loginRepository: Get.find()));
    Get.lazyPut(() => LoginRepository(postWithResponse: Get.find()));
    Get.lazyPut(() => SigninController(loginRepository: Get.find()));
    Get.lazyPut(() => UserModeController());
    Get.lazyPut(() => SignupController(registerRepository: Get.find()));
    Get.lazyPut(() => SignupOptionController());
    Get.lazyPut(() => RegisterRepository(postWithResponse: Get.find()));
  }
}
