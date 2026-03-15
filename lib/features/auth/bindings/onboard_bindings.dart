import 'package:get/get.dart';
import 'package:zb_dezign/features/auth/controller/onboarding_controller.dart';

class OnboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController());
  }
}
