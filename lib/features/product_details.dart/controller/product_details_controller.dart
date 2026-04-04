import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_furniture_customized.dart';

class ProductDetailsController extends GetxController {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  final ScrollController productScrollController = ScrollController();
  RxBool isCartVisible = true.obs;
  RxInt qty = 1.obs;
  RxInt selectedIndex = 0.obs;
  RxInt selectedColor = 0.obs;

  final List<Map<String, dynamic>> woodColors = [
    {'title': 'Walnut', 'color': Colors.amber},
    {'title': 'Oak', 'color': Colors.redAccent},
    {'title': 'Black Ash', 'color': Colors.black},
    {'title': 'Maple', 'color': Colors.green},
    {'title': 'Cherry', 'color': Colors.red},
    {'title': 'Mahogany', 'color': Colors.brown},
    {'title': 'Walnut', 'color': Colors.amber},
    {'title': 'Walnut', 'color': Colors.redAccent},
    {'title': 'Walnut', 'color': Colors.black},
    {'title': 'Walnut', 'color': Colors.green},
  ];
  RxList<bool> isOpen = <bool>[].obs;

  final List<String> tabs = ['Customize', 'Product Details', 'Shipping'];

  final List<Map<String, dynamic>> items = [
    {
      'title': 'Wood Finish Selection',
      'icon': IconsPath.wood,
      'widgets': ProductFurnitureCustomized(),
    },
    {
      'title': 'Marble choices',
      'icon': IconsPath.marble,
      'widgets': ProductFurnitureCustomized(),
    },
    {
      'title': 'Fabric choices',
      'icon': IconsPath.fabric,
      'widgets': ProductFurnitureCustomized(),
    },
    {
      'title': 'Handle choices',
      'icon': IconsPath.hammer,
      'widgets': ProductFurnitureCustomized(),
    },
  ];
  RxInt currentIndex = 0.obs;
  RxBool isAi = false.obs;
  final List<String> images = [
    ImagesPath.chair,
    ImagesPath.chair,
    ImagesPath.chair,
    ImagesPath.chair,
    ImagesPath.chair,
  ];

  void changeIndex(int index) {
    currentIndex.value = index;
    carouselController.animateToPage(index);
  }

  void next() {
    if (currentIndex.value < images.length - 1) {
      changeIndex(currentIndex.value + 1);
    }
  }

  void previous() {
    if (currentIndex.value > 0) {
      changeIndex(currentIndex.value - 1);
    }
  }

  double lastScrollOffset = 0;
  @override
  void onInit() {
    isOpen.value = List.generate(items.length, (index) => false);
    productScrollController.addListener(() {
      double currentScrollOffset = productScrollController.offset;

      if (currentScrollOffset > lastScrollOffset &&
          currentScrollOffset > 100.h) {
        isCartVisible.value = false;
      } else {
        isCartVisible.value = true;
      }

      lastScrollOffset = currentScrollOffset;
    });
    super.onInit();
  }

  @override
  void dispose() {
    productScrollController.dispose();
    super.dispose();
  }
}
