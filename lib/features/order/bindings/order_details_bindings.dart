import 'package:get/get.dart';
import 'package:zb_dezign/features/order/controllers/order_details_controller.dart';
import 'package:zb_dezign/features/order/controllers/order_review_controller.dart';
import 'package:zb_dezign/features/order/repositories/get_order_details_repo.dart';
import 'package:zb_dezign/features/order/repositories/order_review_repo.dart';

class OrderDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetOrderDetailsRepository(getNetwork: Get.find()));
    Get.lazyPut(() => OrderReviewRepository(postWithoutResponse: Get.find()));
    Get.lazyPut(
      () => OrderDetailsController(getOrderDetailsRepository: Get.find()),
    );
    Get.lazyPut(() => OrderReviewController(orderReviewRepository: Get.find()));
  }
}
