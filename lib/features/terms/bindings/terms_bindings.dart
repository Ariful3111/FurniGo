import 'package:get/get.dart';
import 'package:zb_dezign/features/terms/controller/terms_controller.dart';

class TermsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermsController());
  }
}
