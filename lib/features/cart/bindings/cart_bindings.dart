import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/features/cart/controller/select_cart_item_controller.dart';
import 'package:zb_dezign/features/cart/repositories/get_cart_repo.dart';
import 'package:zb_dezign/features/cart/repositories/select_cart_item_repo.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetCartRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => SelectCartItemRepository(postWithoutResponse: Get.find()),
    );
    Get.lazyPut(
      () => SelectCartItemController(selectCartItemRepository: Get.find()),
    );

    Get.lazyPut(
      () => CartController(
        getCartRepository: Get.find(),
        selectCartItemController: Get.find(),
      ),
    );
  }
}
