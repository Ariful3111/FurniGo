import 'package:get/get.dart';
import 'package:zb_dezign/features/profile/controllers/profile_controller.dart';
import 'package:zb_dezign/features/profile/controllers/profile_options_controller.dart';
import 'package:zb_dezign/features/profile/repositories/get_profile_repo.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetProfileRepository(getNetwork: Get.find()));
    Get.lazyPut(() => ProfileController(getProfileRepository: Get.find()));
    Get.lazyPut(() => ProfileOptionsController());
  }
}
