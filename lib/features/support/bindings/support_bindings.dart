import 'package:get/get.dart';
import 'package:zb_dezign/features/support/controller/support_controller.dart';

class SupportBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupportController());
  }
}
