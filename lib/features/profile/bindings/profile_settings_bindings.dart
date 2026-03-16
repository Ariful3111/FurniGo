import 'package:get/get.dart';
import 'package:zb_dezign/features/profile/controllers/profile_setting_controller.dart';
import 'package:zb_dezign/features/profile/controllers/profile_update_controller.dart';

class ProfileSettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileUpdateController());
    Get.lazyPut(() => ProfileSettingController());
  }
}
