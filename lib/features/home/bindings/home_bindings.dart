import 'package:get/get.dart';
import 'package:zb_dezign/features/favorites/controller/toggle_favourite_controller.dart';
import 'package:zb_dezign/features/favorites/repositories/toggle_favourite_repo.dart';
import 'package:zb_dezign/features/home/controller/bottom_nav_controller.dart';
import 'package:zb_dezign/features/home/controller/get_new_arrivals_controller.dart';
import 'package:zb_dezign/features/home/controller/get_product_types_controller.dart';
import 'package:zb_dezign/features/home/controller/get_products_by_type_controller.dart';
import 'package:zb_dezign/features/home/controller/get_rooms_controller.dart';
import 'package:zb_dezign/features/home/controller/global_search_controller.dart';
import 'package:zb_dezign/features/home/controller/home_controller.dart';
import 'package:zb_dezign/features/home/repositories/get_new_arrivals_repo.dart';
import 'package:zb_dezign/features/home/repositories/get_product_type_repo.dart';
import 'package:zb_dezign/features/home/repositories/get_products_by_type_repo.dart';
import 'package:zb_dezign/features/home/repositories/get_rooms_repo.dart';
import 'package:zb_dezign/features/home/repositories/global_search_repo.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetRoomsRepository(getNetwork: Get.find()));
    Get.lazyPut(() => GetNewArrivalsRepository(getNetwork: Get.find()));
    Get.lazyPut(() => GetProductTypeRepository(getNetwork: Get.find()));
    Get.lazyPut(() => GetProductsByTypeRepository(getNetwork: Get.find()));
    Get.lazyPut(() => GlobalSearchRepository(getNetwork: Get.find()));
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => GetRoomsController(getRoomsRepository: Get.find()));
    Get.lazyPut(
      () => GetNewArrivalsController(getNewArrivalsRepository: Get.find()),
    );
    Get.lazyPut(
      () => GetProductTypesController(getProductTypeRepository: Get.find()),
    );
    Get.lazyPut(
      () =>
          GetProductsByTypeController(getProductsByTypeRepository: Get.find()),
    );

    Get.lazyPut(
      () => GlobalSearchController(globalSearchRepository: Get.find()),
    );
    Get.lazyPut(() => CustomDrawerController());

    // Favorites
    Get.lazyPut(
      () => ToggleFavouriteRepository(postWithoutResponse: Get.find()),
    );
    Get.lazyPut(
      () => ToggleFavouriteController(toggleFavouriteRepository: Get.find()),
    );
  }
}
