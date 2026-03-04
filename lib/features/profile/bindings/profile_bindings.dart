import 'package:get/get.dart';
import 'package:zb_dezign/features/profile/controllers/profile_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}