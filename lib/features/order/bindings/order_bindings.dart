import 'package:get/get.dart';
import 'package:zb_dezign/features/order/controllers/order_controller.dart';
import 'package:zb_dezign/features/order/repositories/get_orders_repo.dart';

class OrderBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetOrdersRepository(getNetwork: Get.find()));
    Get.lazyPut(() => OrderController(getOrdersRepository: Get.find()));
  }
}
