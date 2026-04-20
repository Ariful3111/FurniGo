import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class AiProductPlacementController extends GetxController {
  ScrollController shopScrollController = ScrollController();
  ScrollController favoriteScrollController = ScrollController();
  ScrollController cartScrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  RxInt selectedIndex = (-1).obs;
  RxInt selectedShop = (-1).obs;
  RxBool isProduct = false.obs;
  RxInt isProductExpand = (-1).obs;
  RxInt isReplace = 0.obs;
  final roomList = [
    'Living Room',
    'Dining Room',
    'Bathroom',
    'Balcony',
    'Kitchen',
    'Other',
  ];
  List icon = [
    {'icon': IconsPath.aiShop, 'title': 'Shop By Room'},
    {'icon': IconsPath.aiFavorite, 'title': 'Favorite'},
    {'icon': IconsPath.aiCart, 'title': 'Cart'},
    {'icon': IconsPath.aiSearch, 'title': 'Search'},
  ];
  final shopItems = List.generate(30, (index) => index);
  final favoriteItems = List.generate(30, (index) => index);
  final cartItems = List.generate(30, (index) => index);
  RxList<int> shopSelectedItems = <int>[].obs;
  RxList<int> favoriteSelectedItems = <int>[].obs;
  RxList<int> cartSelectedItems = <int>[].obs;
  final ScrollController shopSelectedScrollController = ScrollController();
  final ScrollController favoriteSelectedScrollController = ScrollController();
  final ScrollController cartSelectedScrollController = ScrollController();

  void shopToggleItem(int index) {
    if (shopSelectedItems.contains(index)) {
      shopSelectedItems.remove(index);
    } else {
      shopSelectedItems.add(index);
    }
  }

  void favoriteToggleItem(int index) {
    if (favoriteSelectedItems.contains(index)) {
      favoriteSelectedItems.remove(index);
    } else {
      favoriteSelectedItems.add(index);
    }
  }

  void cartToggleItem(int index) {
    if (cartSelectedItems.contains(index)) {
      cartSelectedItems.remove(index);
    } else {
      cartSelectedItems.add(index);
    }
  }

  void shopScrollLeft() {
    shopSelectedScrollController.animateTo(
      shopSelectedScrollController.offset - 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void shopScrollRight() {
    shopSelectedScrollController.animateTo(
      shopSelectedScrollController.offset + 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void favoriteScrollLeft() {
    favoriteSelectedScrollController.animateTo(
      favoriteSelectedScrollController.offset - 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void favoriteScrollRight() {
    favoriteSelectedScrollController.animateTo(
      favoriteSelectedScrollController.offset + 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void cartScrollLeft() {
    cartSelectedScrollController.animateTo(
      cartSelectedScrollController.offset - 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void cartScrollRight() {
    cartSelectedScrollController.animateTo(
      cartSelectedScrollController.offset + 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    shopScrollController.dispose();
    shopSelectedScrollController.dispose();
    favoriteScrollController.dispose();
    favoriteSelectedScrollController.dispose();
    cartScrollController.dispose();
    cartSelectedScrollController.dispose();
    searchController.dispose();
    super.dispose();
  }
}
