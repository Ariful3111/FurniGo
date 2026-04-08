import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FavoritesController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxString selectedSort = "Most Popular".obs;
  final List<String> sortList = [
    "Most Popular",
    "New Arrivals",
    "Best Selling",
    "Price: Low to High",
    "Requested for Restock",
    "Out of Stock",
  ];
  RxBool isMultiSelect = false.obs;
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
