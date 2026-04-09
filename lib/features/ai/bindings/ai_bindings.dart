import 'package:get/get.dart';
import 'package:zb_dezign/features/ai/controller/ai_controller.dart';

class AiBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AiController());
  }
}
