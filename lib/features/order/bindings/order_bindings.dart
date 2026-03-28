import 'package:get/get.dart';
import 'package:zb_dezign/features/order/controller/order_controller.dart';
import 'package:zb_dezign/features/order/controller/order_details_controller.dart';

class OrderBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderController());
    Get.lazyPut(() => OrderDetailsController());
  }
}
