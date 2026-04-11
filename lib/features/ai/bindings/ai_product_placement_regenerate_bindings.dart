import 'package:get/get.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_regenerate_controller.dart';

class AiProductPlacementRegenerateBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AiProductPlacementRegenerateController());
  }
}
