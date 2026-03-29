import 'package:get/get.dart';
import 'package:zb_dezign/features/home/controller/get_products_by_type_controller.dart';
import 'package:zb_dezign/features/home/models/product_types_model.dart';
import 'package:zb_dezign/features/home/repositories/get_product_type_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class GetProductTypesController extends GetxController {
  final GetProductTypeRepository getProductTypeRepository;
  GetProductTypesController({required this.getProductTypeRepository});

  final productTypes = Rxn<ProductTypesModel>();
  RxBool isLoading = true.obs;
  RxInt selectedProductType = 0.obs;

  Future<void> getProductTypes() async {
    final response = await getProductTypeRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) async {
        productTypes.value = data;
        selectedProductType.value = productTypes.value?.data[0].id.toInt() ?? 0;
        await Get.find<GetProductsByTypeController>().getProductsByType(
          typeID: selectedProductType.value,
        );
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getProductTypes();
  }
}
