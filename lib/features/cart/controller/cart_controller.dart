import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/controller/select_all_cart_item_controller.dart';
import 'package:zb_dezign/features/cart/controller/select_cart_item_controller.dart';
import 'package:zb_dezign/features/cart/models/cart_model.dart';
import 'package:zb_dezign/features/cart/repositories/get_cart_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class CartController extends GetxController {
  final GetCartRepository getCartRepository;
  final SelectCartItemController selectCartItemController;
  final SelectAllCartItemsController selectAllCartItemsController;
  CartController({
    required this.getCartRepository,
    required this.selectCartItemController,
    required this.selectAllCartItemsController,
  });
  RxBool isLoading = false.obs;
  RxBool isAllSelected = false.obs;
  final carts = Rxn<CartModel>();
  final selectedItems = <int>{}.obs;
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
        selectedItems.clear();
        for (var item in data.items ?? []) {
          if (item.isSelected) {
            selectedItems.add(item.id ?? 0);
          }
        }
        isAllSelected.value =
            selectedItems.length == carts.value?.items?.length;
      },
    );
  }

  void toggleItem({required int id}) async {
    if (selectedItems.contains(id)) {
      selectedItems.remove(id);
    } else {
      selectedItems.add(id);
    }
    isAllSelected.value = selectedItems.length == carts.value?.items?.length;
    await selectCartItemController.toggleItem(
      cartItemID: id,
      cartID: carts.value?.id ?? "0",
      selected: selectedItems.contains(id),
    );
  }

  void toggleSelectAll() async {
    if (isAllSelected.value) {
      selectedItems.clear();
      isAllSelected.value = false;
    } else {
      selectedItems.addAll(carts.value?.items?.map((e) => e.id ?? 0) ?? []);
      isAllSelected.value = true;
    }
    await selectAllCartItemsController.toggleItems(
      cartID: carts.value?.id ?? "0",
      selected: isAllSelected.value,
    );
  }

  void deleteItem({required int id}) {}

  void deleteAll() {}

  void increaseQty({required int id}) {}

  void decreaseQty({required int id}) {}
}
