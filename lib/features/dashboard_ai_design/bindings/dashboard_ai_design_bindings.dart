import 'package:get/get.dart';
import 'package:zb_dezign/features/dashboard_ai_design/controller/dashboard_ai_design_controller.dart';
import 'package:zb_dezign/features/dashboard_ai_design/controller/dashboard_ai_design_details_controller.dart';

class DashboardAiDesignBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardAiDesignController());
    Get.lazyPut(() => DashboardAiDesignDetailsController());
  }
}
