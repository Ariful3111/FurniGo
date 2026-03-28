import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/models/rental_details_model.dart';
import 'package:zb_dezign/features/rental/repositories/rental_details_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class RentalDetailsController extends GetxController {
  final RentalDetailsRepository rentalDetailsRepository;
  RentalDetailsController({required this.rentalDetailsRepository});

  final rentalDetails = Rxn<RentalDetailsModel>();
  RxBool isLoading = true.obs;

  Future<void> getRentalDetails({required String rentalRequestUuid}) async {
    final response = await rentalDetailsRepository.execute(
      rentalRequestUuid: rentalRequestUuid,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        rentalDetails.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getRentalDetails(rentalRequestUuid: Get.arguments.toString());
  }
}
