import 'package:get/get.dart';
import 'package:zb_dezign/features/contact_us/controller/contact_us_controller.dart';

class ContactUsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsController());
  }
}
