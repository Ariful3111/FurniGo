import 'package:get/get.dart';
import 'package:zb_dezign/features/profile/controllers/get_user_address_controller.dart';
import 'package:zb_dezign/features/profile/repositories/delete_address_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class DeleteAddressController extends GetxController {
  final DeleteAddressRepository deleteAddressRepository;
  DeleteAddressController({required this.deleteAddressRepository});
  RxBool isLoading = false.obs;

  Future<void> deleteAddress({required int addressID}) async {
    RxBool isLoading = true.obs;
    final response = await deleteAddressRepository.execute(
      addressID: addressID,
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
