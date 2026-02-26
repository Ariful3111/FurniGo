import 'package:get/get.dart';
import 'package:zb_dezign/features/dashboard/controller/dashboard_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}
