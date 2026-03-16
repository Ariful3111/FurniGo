import 'package:get/get.dart';
import 'package:zb_dezign/core/data/global_models/user_profile_model.dart';
import 'package:zb_dezign/features/profile/repositories/get_profile_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class ProfileController extends GetxController {
  final GetProfileRepository getProfileRepository;
  ProfileController({required this.getProfileRepository});

  final userProfile = Rxn<UserProfileModel>();
  RxBool isLoading = true.obs;

  Future<void> getUserProfile() async {
    final response = await getProfileRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        userProfile.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }
}
