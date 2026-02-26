import 'package:get/get.dart';
import 'package:zb_dezign/features/home/controller/bottom_nav_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
  }
}
