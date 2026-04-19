import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/features/cart/controller/delete_cart_item_controller.dart';
import 'package:zb_dezign/features/cart/controller/select_all_cart_item_controller.dart';
import 'package:zb_dezign/features/cart/controller/select_cart_item_controller.dart';
import 'package:zb_dezign/features/cart/repositories/delete_cart_item_repo.dart';
import 'package:zb_dezign/features/cart/repositories/get_cart_repo.dart';
import 'package:zb_dezign/features/cart/repositories/select_all_cart_items_repo.dart';
import 'package:zb_dezign/features/cart/repositories/select_cart_item_repo.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    // Cart repositories
    Get.put(GetCartRepository(getNetwork: Get.find()), permanent: true);
    Get.put(
      SelectCartItemRepository(postWithoutResponse: Get.find()),
      permanent: true,
    );
    Get.put(
      SelectAllCartItemsRepository(postWithoutResponse: Get.find()),
      permanent: true,
    );
    Get.put(
      DeleteCartItemRepository(postWithoutResponse: Get.find()),
      permanent: true,
    );

    // Cart controllers
    Get.put(
      SelectCartItemController(selectCartItemRepository: Get.find()),
      permanent: true,
    );
    Get.put(
      SelectAllCartItemsController(selectAllCartItemsRepository: Get.find()),
      permanent: true,
    );
    Get.put(
      DeleteCartItemController(deleteCartItemRepository: Get.find()),
      permanent: true,
    );
    Get.put(
      CartController(
        getCartRepository: Get.find(),
        selectCartItemController: Get.find(),
        selectAllCartItemsController: Get.find(),
        deleteCartItemController: Get.find(),
      ),
      permanent: true,
    );
  }
}
