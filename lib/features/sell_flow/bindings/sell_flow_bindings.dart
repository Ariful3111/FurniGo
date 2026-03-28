import 'package:get/get.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_controller.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_delivery_controller.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_photos_controller.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_review_controller.dart';

class SellFlowBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SellFlowController());
    Get.lazyPut(() => SellFlowPhotosController());
    Get.lazyPut(() => SellFlowDeliveryController());
    Get.lazyPut(() => SellFlowReviewController());
  }
}
