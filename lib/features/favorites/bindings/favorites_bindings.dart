import 'package:get/get.dart';
import 'package:zb_dezign/features/favorites/controller/favorites_controller.dart';

class FavoritesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritesController());
  }
}
