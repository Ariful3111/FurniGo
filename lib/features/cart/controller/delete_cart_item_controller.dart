import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/repositories/delete_cart_item_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class DeleteCartItemController extends GetxController {
  final DeleteCartItemRepository deleteCartItemRepository;
  DeleteCartItemController({required this.deleteCartItemRepository});
  Future<void> deleteCartItem({
    required int cartItemID,
    required String cartID,
  }) async {
    final response = await deleteCartItemRepository.execute(
      cartID: cartID,
      cartItemID: cartItemID,
    );
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        debugPrint("Item Deleted Successfully: $cartItemID");
      },
    );
  }
}
