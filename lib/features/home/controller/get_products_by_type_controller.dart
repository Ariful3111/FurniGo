import 'package:get/get.dart';
import 'package:zb_dezign/features/home/models/products_model.dart';
import 'package:zb_dezign/features/home/repositories/get_products_by_type_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class GetProductsByTypeController extends GetxController {
  final GetProductsByTypeRepository getProductsByTypeRepository;
  GetProductsByTypeController({required this.getProductsByTypeRepository});

  final products = Rxn<ProductsModel>();
  RxBool isLoading = false.obs;

  Future<void> getProductsByType({required int typeID}) async {
    isLoading.value = true;
    final response = await getProductsByTypeRepository.execute(typeID: typeID);
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        products.value = data;
      },
    );
  }
}
