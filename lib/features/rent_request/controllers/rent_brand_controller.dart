import 'package:get/get.dart';

class RentBrandController extends GetxController {
  RxBool isBrand = false.obs;
  RxList<bool> isSelect = <bool>[].obs;
  List brand = ['Logo Placement', 'Brand Color Matching', 'Custom Finishes'];
  @override
  void onInit() {
    isSelect.assignAll(List.generate(brand.length, (_) => false));
    super.onInit();
  }
}
