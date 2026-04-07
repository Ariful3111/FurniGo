import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_availability.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_categories.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_fabric.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_material.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_price.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_promotion.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_review.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter_wood.dart';

class ShopController extends GetxController {
  TextEditingController searchController = TextEditingController();
  ScrollController categoryScrollController = ScrollController();
  ScrollController materialScrollController = ScrollController();
  ScrollController woodScrollController = ScrollController();
  ScrollController fabricScrollController = ScrollController();
  RxString selectedSort = "Most Popular".obs;
  final List<String> sortList = [
    "Most Popular",
    "New Arrivals",
    "Best Selling",
    "Price: Low to High",
    "Requested for Restock",
    "Out of Stock",
  ];
  RxInt selectedIndex = 0.obs;
  final List<String> categories = [
    'All',
    'Sofas',
    'Table',
    'Lightning',
    'Storage',
    'Decor',
    'Display',
  ];
  RxList<bool> expandedList = <bool>[].obs;

  final List<Map<String, dynamic>> sections = [
    {
      'title': 'By Categories',
      'icon': true,
      'image': IconsPath.category,
      'widget': ShopSearchFilterCategories(),
    },
    {
      'title': 'By Material',
      'icon': true,
      'image': IconsPath.material,
      'widget': ShopSearchFilterMaterial(),
    },
    {
      'title': 'Wood Finish',
      'icon': true,
      'image': IconsPath.wood,
      'widget': ShopSearchFilterWood(),
    },
    {
      'title': 'By Fabric',
      'icon': true,
      'image': IconsPath.fabric,
      'widget': ShopSearchFilterFabric(),
    },
    {'title': 'Review', 'icon': false, 'widget': ShopSearchFilterReview()},
    {'title': 'By Price', 'icon': false, 'widget': ShopSearchFilterPrice()},
    {
      'title': 'By Promotions',
      'icon': false,
      'widget': ShopSearchFilterPromotion(),
    },
    {
      'title': 'Availability',
      'icon': false,
      'widget': ShopSearchFilterAvailability(),
    },
  ];

  List<String> byCategories = [
    'Living Room',
    'BedRoom',
    'Dining Room',
    'Home Office',
    'Office',
    'Kitchen',
  ];
  RxList<bool> isCheckedCategory = <bool>[].obs;
  List<String> material = [
    'Solid Wood',
    'Metal',
    'Bouclé Fabric',
    'Leather',
    'Marble Top',
  ];
  RxList<bool> isCheckedMaterial = <bool>[].obs;
  List<String> wood = ['Oak', 'Walnut', 'Black Ash'];
  RxList<bool> isCheckedWood = <bool>[].obs;
  List<String> fabric = ['Linen', 'Velvet', 'Silk'];
  RxList<bool> isCheckedFabric = <bool>[].obs;
  List<String> promotion = ['New Arrivals', 'Best Sellers', 'On Sale'];
  RxList<bool> isCheckedPromotion = <bool>[].obs;
  List<String> availability = ['In Stock', 'Out of Stock'];
  RxList<bool> isCheckedAvailability = <bool>[].obs;
  List<double> ratings = [5, 4, 3, 2, 1];
  RxList<bool> selectedRatingList = List.generate(5, (index) => false).obs;
  RxDouble minPrice = 50.0.obs;
  RxDouble maxPrice = 1500.0.obs;

  final double minLimit = 0;
  final double maxLimit = 2000;
  @override
  void onInit() {
    expandedList.value = List.generate(sections.length, (_) => false);
    isCheckedCategory.value = List.generate(byCategories.length, (_) => false);
    isCheckedMaterial.value = List.generate(material.length, (_) => false);
    isCheckedWood.value = List.generate(wood.length, (_) => false);
    isCheckedFabric.value = List.generate(fabric.length, (_) => false);
    isCheckedPromotion.value = List.generate(promotion.length, (_) => false);
    isCheckedAvailability.value = List.generate(
      availability.length,
      (_) => false,
    );
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    categoryScrollController.dispose();
    materialScrollController.dispose();
    fabricScrollController.dispose();
    woodScrollController.dispose();
    super.dispose();
  }
}
