import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/models/cart_model.dart';
import 'package:zb_dezign/features/cart/repositories/get_cart_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class CartController extends GetxController {
  final GetCartRepository getCartRepository;
  CartController({required this.getCartRepository});
  RxBool isLoading = false.obs;
  RxBool isAllSelected = false.obs;
  final carts = Rxn<CartModel>();
  @override
  void onInit() {
    super.onInit();
    getCart();
  }

  Future<void> getCart() async {
    isLoading.value = true;
    final response = await getCartRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        carts.value = data;
        debugPrint("Cart Length: ${carts.value!.items!.length}");
      },
    );
  }

  void toggleItem({required int id}) {
    for (var element in carts.value?.items ?? []) {
      if (element.id == id) {
        element.isSelected = !element.isSelected;
        break;
      }
    }
  }

  void toggleSelectAll() {}

  void deleteItem({required int id}) {}

  void deleteAll() {}

  void increaseQty({required int id}) {}

  void decreaseQty({required int id}) {}
}
