import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/repositories/add_to_cart_repo.dart';
import 'package:zb_dezign/features/home/models/rooms_model.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';
import 'package:zb_dezign/shared/widgets/snackbars/success_snackbar.dart';

class AddToCartController extends GetxController {
  final AddToCartRepository addToCartRepository;
  AddToCartController({required this.addToCartRepository});

  final rooms = Rxn<RoomsModel>();
  RxBool isLoading = false.obs;

  Future<void> addToCart({
    required int productID,
    required int quantity,
    required List<int> options,
  }) async {
    if (options.isEmpty) {
      ErrorSnackbar.show(description: 'Please select an attribute');
    } else {
      isLoading.value = true;
      final response = await addToCartRepository.execute(
        productID: productID,
        quantity: quantity,
        options: options,
      );
      response.fold(
        (error) {
          ErrorSnackbar.show(description: error.message);
        },
        (data) {
          isLoading.value = false;
          SuccessSnackbar.show(description: "Added to cart successfully");
        },
      );
    }
  }
}
