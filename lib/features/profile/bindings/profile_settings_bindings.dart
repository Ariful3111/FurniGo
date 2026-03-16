import 'package:get/get.dart';
import 'package:zb_dezign/features/profile/controllers/add_address_controller.dart';
import 'package:zb_dezign/features/profile/controllers/delete_address_controller.dart';
import 'package:zb_dezign/features/profile/controllers/get_user_address_controller.dart';
import 'package:zb_dezign/features/profile/controllers/profile_setting_controller.dart';
import 'package:zb_dezign/features/profile/controllers/profile_update_controller.dart';
import 'package:zb_dezign/features/profile/controllers/update_address_controller.dart';
import 'package:zb_dezign/features/profile/repositories/add_address_repo.dart';
import 'package:zb_dezign/features/profile/repositories/delete_address_repo.dart';
import 'package:zb_dezign/features/profile/repositories/get_user_address_repo.dart';
import 'package:zb_dezign/features/profile/repositories/update_address_repo.dart';

class ProfileSettingsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetUserAddressRepository(getNetwork: Get.find()));
    Get.lazyPut(() => AddAddressRepository(postWithoutResponse: Get.find()));
    Get.lazyPut(() => DeleteAddressRepository(postWithoutResponse: Get.find()));
    Get.lazyPut(() => UpdateAddressRepository(postWithoutResponse: Get.find()));
    Get.lazyPut(() => ProfileUpdateController());
    Get.lazyPut(() => ProfileSettingController());
    Get.lazyPut(() => AddAddressController(addAddressRepository: Get.find()));
    Get.lazyPut(
      () => GetUserAddressController(getUserAddressRepository: Get.find()),
    );
    Get.lazyPut(
      () => DeleteAddressController(deleteAddressRepository: Get.find()),
    );
    Get.lazyPut(
      () => UpdateAddressController(updateAddressRepository: Get.find()),
    );
  }
}
