import 'package:get/get.dart';
import 'package:zb_dezign/features/favorites/models/favourite_model.dart';
import 'package:zb_dezign/features/favorites/repositories/get_favorite_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class GetFavouritesController extends GetxController {
  final GetFavoriteRepository getFavoriteRepository;
  GetFavouritesController({required this.getFavoriteRepository});

  final favourites = Rxn<FavouriteModel>();
  RxBool isLoading = true.obs;

  Future<void> getFavourites() async {
    final response = await getFavoriteRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        favourites.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getFavourites();
  }
}
