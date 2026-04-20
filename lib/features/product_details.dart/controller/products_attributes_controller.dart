import 'package:get/get.dart';
import 'package:zb_dezign/features/product_details.dart/models/product_attributes_model.dart';
import 'package:zb_dezign/features/product_details.dart/repositories/product_attributes_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class ProductAttributesController extends GetxController {
  final ProductAttributesRepository productAttributesRepository;
  ProductAttributesController({required this.productAttributesRepository});

  final productsAttributes = Rxn<ProductAttributesModel>();
  RxBool isLoading = true.obs;
  RxList<bool> isOpen = <bool>[].obs;
  RxList<int> selectedIDs = <int>[].obs;

  Future<void> getProductsAttributes({required int productID}) async {
    isLoading.value = true;
    final response = await productAttributesRepository.execute(
      productID: productID,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        productsAttributes.value = data;
        isOpen.value = List.generate(data.data.length, (index) => index == 0);
      },
    );
  }

  void toggleExpand(int index) {
    isOpen[index] = !isOpen[index];
  }

  void toggleSelection({required int attributeID}) {
    if (selectedIDs.contains(attributeID)) {
      selectedIDs.remove(attributeID);
    } else {
      selectedIDs.add(attributeID);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProductsAttributes(productID: Get.arguments);
  }
}
