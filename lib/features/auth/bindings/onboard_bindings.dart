import 'package:get/get.dart';
import 'package:zb_dezign/features/auth/controller/google_login_controller.dart';
import 'package:zb_dezign/features/auth/controller/onboarding_controller.dart';
import 'package:zb_dezign/features/auth/repositories/google_login_repo.dart';

class OnboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoogleLoginRepository(postWithResponse: Get.find()));
    Get.lazyPut(() => OnboardingController());
    Get.lazyPut(() => GoogleLoginController(loginRepository: Get.find()));
  }
}
