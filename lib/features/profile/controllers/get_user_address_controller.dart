import 'package:get/get.dart';
import 'package:zb_dezign/features/profile/models/user_address_model.dart';
import 'package:zb_dezign/features/profile/repositories/get_user_address_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class GetUserAddressController extends GetxController {
  final GetUserAddressRepository getUserAddressRepository;
  GetUserAddressController({required this.getUserAddressRepository});

  final userAddress = Rxn<UserAddressModel>();
  RxBool isLoading = true.obs;

  Future<void> getUserAddress() async {
    final response = await getUserAddressRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        userAddress.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getUserAddress();
  }
}
