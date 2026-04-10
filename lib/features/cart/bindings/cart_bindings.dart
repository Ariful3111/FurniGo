import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/features/cart/repositories/get_cart_repo.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetCartRepository(getNetwork: Get.find()));
    Get.lazyPut(() => CartController(getCartRepository: Get.find()));
  }
}
