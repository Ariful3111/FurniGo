import 'package:get/get.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_controller.dart';

class SellFlowBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SellFlowController());
  }
}
