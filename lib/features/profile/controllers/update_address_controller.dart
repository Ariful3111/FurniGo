import 'package:get/get.dart';
import 'package:zb_dezign/features/profile/controllers/get_user_address_controller.dart';
import 'package:zb_dezign/features/profile/repositories/update_address_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class UpdateAddressController extends GetxController {
  final UpdateAddressRepository updateAddressRepository;
  UpdateAddressController({required this.updateAddressRepository});
  RxBool isLoading = false.obs;

  Future<void> updateAddress({
    required int addressID,
    required bool isDefault,
  }) async {
    isLoading.value = true;
    final response = await updateAddressRepository.execute(
      addressID: addressID,
      isDefault: isDefault,
    );
    response.fold(
      (error) {
        isLoading.value = false;
        ErrorSnackbar.show(description: error.message);
      },
      (data) async {
        await Get.find<GetUserAddressController>().getUserAddress();
        isLoading.value = false;
      },
    );
  }
}
