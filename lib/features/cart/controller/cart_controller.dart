import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/cart/models/cart_item_model.dart';

class CartController extends GetxController {
  RxList<CartItemModel> cartList = <CartItemModel>[].obs;
  RxBool isAllSelected = false.obs;
  @override
  void onInit() {
    super.onInit();
    cartList.addAll([
      CartItemModel(
        name: "ECHO LOUNGE CHAIR",
        category: "Chair",
        color: "Blue",
        image: ImagesPath.chair,
        price: 320,
      ),
      CartItemModel(
        name: "LUXE CUP SOFA",
        category: "Chair",
        color: "Blue",
        image: ImagesPath.chair,
        price: 320,
      ),
      CartItemModel(
        name: "MODERN CHAIR",
        category: "Chair",
        color: "Blue",
        image: ImagesPath.chair,
        price: 320,
      ),
    ]);
  }

  void toggleItem(int index) {
    cartList[index].isSelected.toggle();
    isAllSelected.value =
        cartList.every((item) => item.isSelected.value);
  }
  void toggleSelectAll() {
    isAllSelected.toggle();

    for (var item in cartList) {
      item.isSelected.value = isAllSelected.value;
    }
  }
  void deleteItem(int index) {
    cartList.removeAt(index);

    isAllSelected.value =
        cartList.isNotEmpty &&
        cartList.every((item) => item.isSelected.value);
  }
  void deleteAll() {
    cartList.clear();
    isAllSelected.value = false;
  }
  void increaseQty(int index) {
    cartList[index].quantity++;
    cartList.refresh();
  }

  void decreaseQty(int index) {
    if (cartList[index].quantity > 1) {
      cartList[index].quantity--;
      cartList.refresh();
    }
  }
}