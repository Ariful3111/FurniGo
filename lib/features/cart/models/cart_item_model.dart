import 'package:get/get.dart';

class CartItemModel {
  String name;
  String category;
  String color;
  String image;
  double price;
  int quantity;
  RxBool isSelected;

  CartItemModel({
    required this.name,
    required this.category,
    required this.color,
    required this.image,
    required this.price,
    this.quantity = 1,
    bool selected = false,
  }) : isSelected = selected.obs;
}
