import 'package:get/get.dart';
import 'package:zb_dezign/features/profile/controllers/get_user_address_controller.dart';
import 'package:zb_dezign/features/profile/controllers/profile_setting_controller.dart';
import 'package:zb_dezign/features/profile/controllers/profile_update_controller.dart';
import 'package:zb_dezign/features/profile/repositories/get_user_address_repo.dart';

class ProfileSettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetUserAddressRepository(getNetwork: Get.find()));
    Get.lazyPut(() => ProfileUpdateController());
    Get.lazyPut(() => ProfileSettingController());
    Get.lazyPut(
      () => GetUserAddressController(getUserAddressRepository: Get.find()),
    );
  }
}
