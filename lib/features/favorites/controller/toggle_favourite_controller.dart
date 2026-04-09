import 'package:get/get.dart';
import 'package:zb_dezign/features/favorites/controller/get_favourites_controller.dart';
import 'package:zb_dezign/features/favorites/repositories/toggle_favourite_repo.dart';
import 'package:zb_dezign/features/home/controller/get_new_arrivals_controller.dart';
import 'package:zb_dezign/features/home/controller/get_products_by_type_controller.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class ToggleFavouriteController extends GetxController {
  final ToggleFavouriteRepository toggleFavouriteRepository;
  ToggleFavouriteController({required this.toggleFavouriteRepository});
  RxBool isLoading = false.obs;

  Future<void> toggleFavourite({
    required int productID,
    required int changeIndex,
  }) async {
    if (changeIndex == 0) {
      toggleNewArrival(productID: productID);
    } else if (changeIndex == 1) {
      toggleCategoryProduct(productID: productID);
    } else if (changeIndex == 2) {
      toggleFavouriteProduct(productID: productID);
    }
    isLoading.value = true;
    final response = await toggleFavouriteRepository.execute(
      productID: productID,
    );
    isLoading.value = false;
    response.fold((error) {
      ErrorSnackbar.show(description: error.message);
    }, (data) {});
  }

  Future<void> toggleNewArrival({required int productID}) async {
    Get.find<GetNewArrivalsController>().newArrivals.value?.data.forEach((
      element,
    ) {
      if (element.id == productID) {
        element.isFavourite = !element.isFavourite;
      }
    });
    Get.find<GetNewArrivalsController>().newArrivals.refresh();
  }

  Future<void> toggleCategoryProduct({required int productID}) async {
    Get.find<GetProductsByTypeController>().products.value?.data.forEach((
      element,
    ) {
      if (element.id == productID) {
        element.isFavourite = !element.isFavourite;
      }
    });
    Get.find<GetProductsByTypeController>().products.refresh();
  }

  Future<void> toggleFavouriteProduct({required int productID}) async {
    Get.find<GetFavouritesController>().favourites.value?.data.removeWhere((
      element,
    ) {
      if (element.product.id == productID) {
        toggleNewArrival(productID: productID);
        toggleCategoryProduct(productID: productID);
        return true;
      }
      return false;
    });
    Get.find<GetFavouritesController>().favourites.refresh();
  }
}
