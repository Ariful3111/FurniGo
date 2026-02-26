import 'package:get/get.dart';
import 'package:zb_dezign/features/dashboard/controller/dashboard_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer_controller.dart';

class DashboardBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => CustomDrawerController());
  }
}
