import 'package:get/get.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';

class ProductDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
  }
}
