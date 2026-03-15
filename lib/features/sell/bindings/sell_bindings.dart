import 'package:get/get.dart';
import 'package:zb_dezign/features/sell/controller/sell_controller.dart';
import 'package:zb_dezign/features/sell/controller/sell_details_controller.dart';

class SellBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SellController());
    Get.lazyPut(() => SellDetailsController());
  }
}
