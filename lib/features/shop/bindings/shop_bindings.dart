import 'package:get/get.dart';
import 'package:zb_dezign/features/shop/controller/shop_controller.dart';

class ShopBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopController());
  }
}
