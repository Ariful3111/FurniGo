import 'package:get/get.dart';
import 'package:zb_dezign/features/auth/controller/logout_controller.dart';
import 'package:zb_dezign/features/auth/repositories/logout_repo.dart';
import 'package:zb_dezign/features/profile/controllers/profile_controller.dart';
import 'package:zb_dezign/features/profile/controllers/profile_options_controller.dart';
import 'package:zb_dezign/features/profile/repositories/get_profile_repo.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer_controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetProfileRepository(getNetwork: Get.find()));
    Get.lazyPut(() => LogoutRepository(postWithoutResponse: Get.find()));
    Get.lazyPut(() => ProfileController(getProfileRepository: Get.find()));
    Get.lazyPut(() => ProfileOptionsController());
    Get.lazyPut(() => LogoutController(logoutRepository: Get.find()));
    Get.lazyPut(() => CustomDrawerController());
  }
}
