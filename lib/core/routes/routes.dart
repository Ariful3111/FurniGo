import 'package:get/get.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/bindings/auth_bindings.dart';
import 'package:zb_dezign/features/auth/views/onboarding_view.dart';
import 'package:zb_dezign/features/auth/views/signin_view.dart';
import 'package:zb_dezign/features/auth/views/signup_option_view.dart';
import 'package:zb_dezign/features/auth/views/signup_view.dart';
import 'package:zb_dezign/features/auth/views/user_mode_view.dart';
import 'package:zb_dezign/features/rent_request/bindings/rent_bindings.dart';
import 'package:zb_dezign/features/rent_request/views/rent_business_identification.dart';
import 'package:zb_dezign/features/rental/bindings/rental_bindings.dart';
import 'package:zb_dezign/features/rental/views/rental_view.dart';

final List<GetPage> appRoutes = [
  GetPage(
    name: AppRoutes.onboardingView,
    page: () => OnboardingView(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.signInView,
    page: () => SigninView(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.userModeView,
    page: () => UserModeView(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.signUpView,
    page: () => SignupView(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.signUpOptionView,
    page: () => SignupOptionView(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.rentBusinessIdentification,
    page: () => RentBusinessIdentification(),
    binding: RentBindings(),
  ),
  GetPage(
    name: AppRoutes.rentalView,
    page: () => RentalView(),
    binding: RentalBindings(),
  ),
];
