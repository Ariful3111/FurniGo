import 'package:get/get.dart';
import 'package:zb_dezign/core/data/global_models/google_user_info_model.dart';
import 'package:zb_dezign/core/data/local/storage_service.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/repositories/google_login_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';
import 'package:zb_dezign/shared/widgets/snackbars/success_snackbar.dart';

class GoogleLoginController extends GetxController {
  final GoogleLoginRepository loginRepository;
  GoogleLoginController({required this.loginRepository});
  RxBool isLoading = false.obs;
  final storage = Get.find<StorageService>();

  Future<void> googleLogin({required GoogleUserInfoModel user}) async {
    isLoading.value = true;
    final response = await loginRepository.execute(
      name: user.name,
      email: user.email,
      avatar: user.avatarUrl,
      token: user.idToken,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message.toString());
      },
      (data) async {
        await storage.write(key: storage.tokenKey, value: user.idToken);
        SuccessSnackbar.show(description: 'Login Successful');
        Get.toNamed(AppRoutes.bottomNav);
      },
    );
  }
}
