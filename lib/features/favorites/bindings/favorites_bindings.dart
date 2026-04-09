import 'package:get/get.dart';
import 'package:zb_dezign/features/favorites/controller/favorites_controller.dart';
import 'package:zb_dezign/features/favorites/controller/get_favourites_controller.dart';
import 'package:zb_dezign/features/favorites/repositories/get_favorite_repo.dart';

class FavoritesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetFavoriteRepository(getNetwork: Get.find()));
    Get.lazyPut(() => FavoritesController());
    Get.lazyPut(
      () => GetFavouritesController(getFavoriteRepository: Get.find()),
    );
  }
}
