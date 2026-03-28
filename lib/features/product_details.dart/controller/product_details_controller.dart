import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/images_path.dart';

class ProductDetailsController extends GetxController {
  final CarouselSliderController carouselController =
      CarouselSliderController();

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
}
