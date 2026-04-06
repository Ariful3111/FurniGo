import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/product_details.dart/models/product_details_model.dart';
import 'package:zb_dezign/features/product_details.dart/repositories/product_details_repo.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_furniture_customized.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class ProductDetailsController extends GetxController {
  final ProductDetailsRepository productDetailsRepository;
  ProductDetailsController({required this.productDetailsRepository});
  final CarouselSliderController carouselController =
      CarouselSliderController();
  final ScrollController productScrollController = ScrollController();
  RxBool isCartVisible = true.obs;
  RxBool isStock = false.obs;
  RxInt qty = 1.obs;
  RxInt selectedIndex = 0.obs;
  RxInt selectedColor = 0.obs;
  RxBool isLoading = true.obs;

  final productDetails = Rxn<ProductDetailsModel>();

  Future<void> getProductDetails({required int productID}) async {
    isLoading.value = true;
    final response = await productDetailsRepository.execute(
      productID: productID,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        productDetails.value = data;
      },
    );
  }

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

  void changeIndex(int index) {
    currentIndex.value = index;
    carouselController.animateToPage(index);
  }

  void next({required int imagesLength}) {
    if (imagesLength <= 1) return;
    int nextIndex = (currentIndex.value + 1) % imagesLength;
    changeIndex(nextIndex);
  }

  void previous({required int imagesLength}) {
    if (imagesLength <= 1) return;
    int prevIndex = (currentIndex.value - 1 + imagesLength) % imagesLength;
    changeIndex(prevIndex);
  }

  RxInt reviewIndex = 0.obs;

  final reviews = [
    {
      "name": "Ramic Matue",
      "time": "2 days ago",
      "rating": 4.9,
      "image": IconsPath.profile,
      "review":
          "NextGen's dedication to sustainability and ethical practices resonates strongly with today's consumers.",
    },
    {
      "name": "John Doe",
      "time": "5 days ago",
      "rating": 4.5,
      "image": IconsPath.profile,
      "review":
          "Amazing product quality and fast delivery. Highly recommended!",
    },
    {
      "name": "Sarah Ali",
      "time": "1 week ago",
      "rating": 4.8,
      "image": IconsPath.profile,
      "review": "Loved the design and comfort. Will definitely buy again.",
    },
  ];
  TextEditingController ratingController = TextEditingController();
  RxDouble rating = 0.0.obs;
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
    getProductDetails(productID: Get.arguments);
  }

  @override
  void dispose() {
    productScrollController.dispose();
    ratingController.dispose();
    super.dispose();
  }
}
