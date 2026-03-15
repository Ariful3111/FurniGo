import 'package:get/get.dart';
import 'package:zb_dezign/features/auth/controller/email_verification_controller.dart';
import 'package:zb_dezign/features/auth/controller/forgot_password_controller.dart';
import 'package:zb_dezign/features/auth/controller/new_password_controller.dart';
import 'package:zb_dezign/features/auth/controller/otp_controller.dart';
import 'package:zb_dezign/features/auth/controller/signin_controller.dart';
import 'package:zb_dezign/features/auth/controller/signup_controller.dart';
import 'package:zb_dezign/features/auth/controller/signup_option_controller.dart';
import 'package:zb_dezign/features/auth/controller/user_mode_controller.dart';
import 'package:zb_dezign/features/auth/repositories/login_repo.dart';
import 'package:zb_dezign/features/auth/repositories/register_repo.dart';

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninController(loginRepository: Get.find()));
    Get.lazyPut(() => LoginRepository(postWithResponse: Get.find()));
    Get.lazyPut(() => SigninController(loginRepository: Get.find()));
    Get.lazyPut(() => UserModeController());
    Get.lazyPut(() => SignupController(registerRepository: Get.find()));
    Get.lazyPut(() => SignupOptionController());
    Get.lazyPut(() => RegisterRepository(postWithResponse: Get.find()));
    Get.lazyPut(() => ForgotPasswordController());
    Get.lazyPut(() => OtpController());
    Get.lazyPut(() => NewPasswordController());
    Get.lazyPut(() => EmailVerificationController());
  }
}
