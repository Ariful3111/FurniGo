import 'package:get/get.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';

class AiInteriorDesignBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AiInteriorDesignController());
  }
}
