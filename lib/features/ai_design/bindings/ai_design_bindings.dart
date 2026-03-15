import 'package:get/get.dart';
import 'package:zb_dezign/features/ai_design/controller/ai_design_controller.dart';
import 'package:zb_dezign/features/ai_design/controller/ai_design_details_controller.dart';

class AiDesignBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AiDesignController());
    Get.lazyPut(() => AiDesignDetailsController());
  }
}
