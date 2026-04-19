import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/repositories/select_all_cart_items_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class SelectAllCartItemsController extends GetxController {
  final SelectAllCartItemsRepository selectAllCartItemsRepository;
  SelectAllCartItemsController({required this.selectAllCartItemsRepository});
  RxBool isLoading = false.obs;

  Future<void> toggleItems({
    required String cartID,
    required bool selected,
  }) async {
    isLoading.value = true;
    final response = await selectAllCartItemsRepository.execute(
      cartID: cartID,
      selected: selected,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        debugPrint("Item Selected: $selected");
      },
    );
  }
}
