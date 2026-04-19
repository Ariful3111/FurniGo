import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/repositories/select_cart_item_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class SelectCartItemController extends GetxController {
  final SelectCartItemRepository selectCartItemRepository;
  SelectCartItemController({required this.selectCartItemRepository});
  RxBool isLoading = false.obs;

  Future<void> toggleItem({
    required int cartItemID,
    required String cartID,
    required bool selected,
  }) async {
    isLoading.value = true;
    final response = await selectCartItemRepository.execute(
      cartItemID: cartItemID,
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
