import 'package:get/get.dart';
import 'package:zb_dezign/features/membership/controller/subscription_controller.dart';

class SubscriptionBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SubscriptionController());
  }
}
