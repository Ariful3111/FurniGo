import 'package:get/get.dart';
import 'package:zb_dezign/features/category/controller/category_controller.dart';
import 'package:zb_dezign/features/dashboard/controller/dashboard_controller.dart';

class CategoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => DashboardController());
  }
}
