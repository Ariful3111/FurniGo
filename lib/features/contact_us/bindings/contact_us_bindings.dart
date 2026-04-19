import 'package:get/get.dart';

class ContactUsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsBindings());
  }
}
