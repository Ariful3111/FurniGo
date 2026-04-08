import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/controller/checkout_controller.dart';

class CheckoutBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutController());
  }
}