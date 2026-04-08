import 'package:get/get.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_controller.dart';

class AiProductPlacementBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AiProductPlacementController());
  }
}
