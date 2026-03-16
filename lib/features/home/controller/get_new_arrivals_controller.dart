import 'package:get/get.dart';
import 'package:zb_dezign/features/home/models/products_model.dart';
import 'package:zb_dezign/features/home/repositories/get_new_arrivals_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class GetNewArrivalsController extends GetxController {
  final GetNewArrivalsRepository getNewArrivalsRepository;
  GetNewArrivalsController({required this.getNewArrivalsRepository});

  final newArrivals = Rxn<ProductsModel>();
  RxBool isLoading = true.obs;

  Future<void> getNewArrivals() async {
    final response = await getNewArrivalsRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        newArrivals.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getNewArrivals();
  }
}
