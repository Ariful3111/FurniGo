import 'package:get/get.dart';
import 'package:zb_dezign/features/home/models/products_model.dart';
import 'package:zb_dezign/features/product_details.dart/repositories/related_products_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class RelatedProductsController extends GetxController {
  final RelatedProductsRepository relatedProductsRepository;
  RelatedProductsController({required this.relatedProductsRepository});

  final relatedProducts = Rxn<ProductsModel>();
  RxBool isLoading = true.obs;

  Future<void> getRelatedProducts({required int productID}) async {
    isLoading.value = true;
    final response = await relatedProductsRepository.execute(
      productID: productID,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        relatedProducts.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getRelatedProducts(productID: Get.arguments);
  }
}
