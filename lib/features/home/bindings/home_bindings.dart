import 'package:get/get.dart';
import 'package:zb_dezign/features/category/controller/category_controller.dart';
import 'package:zb_dezign/features/home/controller/bottom_nav_controller.dart';
import 'package:zb_dezign/features/home/controller/home_controller.dart';
import 'package:zb_dezign/features/profile/controllers/profile_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => HomeController());
  }
}
