import 'package:get/get.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/features/product_details.dart/repositories/product_details_repo.dart';

class ProductDetailsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => ProductDetailsController(productDetailsRepository: Get.find()),
    );
  }
}
