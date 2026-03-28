import 'package:get/get.dart';
import 'package:zb_dezign/core/data/local/storage_service.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/repositories/logout_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class LogoutController extends GetxController {
  final LogoutRepository logoutRepository;
  LogoutController({required this.logoutRepository});
  final storage = Get.find<StorageService>();
  RxBool isLoading = false.obs;

  Future<void> logout() async {
    isLoading.value = true;
    final response = await logoutRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) async {
        ErrorSnackbar.show(description: error.message);
        await storage.remove(key: storage.tokenKey);
        Get.offAllNamed(AppRoutes.signInView);
      },
      (data) async {
        await storage.remove(key: storage.tokenKey);
        Get.offAllNamed(AppRoutes.signInView);
      },
    );
  }
}
