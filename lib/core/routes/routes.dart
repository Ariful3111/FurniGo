import 'package:get/get.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/ai_design/bindings/ai_design_bindings.dart';
import 'package:zb_dezign/features/ai_design/views/ai_design_details.dart';
import 'package:zb_dezign/features/ai_design/views/ai_design_view.dart';
import 'package:zb_dezign/features/auth/bindings/auth_bindings.dart';
import 'package:zb_dezign/features/auth/bindings/onboard_bindings.dart';
import 'package:zb_dezign/features/auth/views/email_verification_view.dart';
import 'package:zb_dezign/features/auth/views/forgot_password_view.dart';
import 'package:zb_dezign/features/auth/views/new_password_view.dart';
import 'package:zb_dezign/features/auth/views/onboarding_view.dart';
import 'package:zb_dezign/features/auth/views/otp_view.dart';
import 'package:zb_dezign/features/auth/views/signin_view.dart';
import 'package:zb_dezign/features/auth/views/signup_option_view.dart';
import 'package:zb_dezign/features/auth/views/signup_view.dart';
import 'package:zb_dezign/features/auth/views/user_mode_view.dart';
import 'package:zb_dezign/features/credit_balance/bindings/credit_balance_bindings.dart';
import 'package:zb_dezign/features/credit_balance/views/credit_balance_view.dart';
import 'package:zb_dezign/features/dashboard/bindings/dashboard_bindings.dart';
import 'package:zb_dezign/features/dashboard/views/dashboard_payment_view.dart';
import 'package:zb_dezign/features/dashboard/views/dashboard_view.dart';
import 'package:zb_dezign/features/order/bindings/order_bindings.dart';
import 'package:zb_dezign/features/order/views/order_details_view.dart';
import 'package:zb_dezign/features/order/views/order_view.dart';
import 'package:zb_dezign/features/home/bindings/home_bindings.dart';
import 'package:zb_dezign/features/home/views/bottom_nav_view.dart';
import 'package:zb_dezign/features/notification/bindings/notification_bindings.dart';
import 'package:zb_dezign/features/notification/views/notification_view.dart';
import 'package:zb_dezign/features/payment/bindings/payment_bindings.dart';
import 'package:zb_dezign/features/payment/views/payment_view.dart';
import 'package:zb_dezign/features/profile/bindings/profile_bindings.dart';
import 'package:zb_dezign/features/profile/views/profile_setting_view.dart';
import 'package:zb_dezign/features/profile/views/profile_views.dart';
import 'package:zb_dezign/features/rent_request/bindings/rent_bindings.dart';
import 'package:zb_dezign/features/rent_request/views/rent_request_view.dart';
import 'package:zb_dezign/features/rental/bindings/rental_bindings.dart';
import 'package:zb_dezign/features/rental/views/rental_pending_view.dart';
import 'package:zb_dezign/features/rental/views/rental_view.dart';
import 'package:zb_dezign/features/sell/bindings/sell_bindings.dart';
import 'package:zb_dezign/features/sell/views/sell_details.dart';
import 'package:zb_dezign/features/sell/views/sell_view.dart';
import 'package:zb_dezign/features/support/bindings/support_bindings.dart';
import 'package:zb_dezign/features/support/views/support_view.dart';
import 'package:zb_dezign/features/transaction/bindings/transaction_bindings.dart';
import 'package:zb_dezign/features/transaction/views/transaction_details_view.dart';
import 'package:zb_dezign/features/transaction/views/transaction_view.dart';

final List<GetPage> appRoutes = [
  GetPage(
    name: AppRoutes.onboardingView,
    page: () => OnboardingView(),
    binding: OnboardBindings(),
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
    name: AppRoutes.rentRequestView,
    page: () => RentRequestView(),
    binding: RentBindings(),
  ),
  GetPage(
    name: AppRoutes.rentalView,
    page: () => RentalView(),
    binding: RentalBindings(),
  ),
  GetPage(
    name: AppRoutes.forgotPasswordView,
    page: () => ForgotPasswordView(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.otpView,
    page: () => OtpView(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.newPasswordView,
    page: () => NewPasswordView(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.emailVerificationView,
    page: () => EmailVerificationView(),
    binding: AuthBindings(),
  ),
  GetPage(
    name: AppRoutes.rentalPendingView,
    page: () => RentalPendingView(),
    binding: RentalBindings(),
  ),
  GetPage(
    name: AppRoutes.dashboardView,
    page: () => DashboardView(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: AppRoutes.bottomNav,
    page: () => BottomNavView(),
    bindings: [HomeBindings(),DashboardBindings()]
  ),
  GetPage(
    name: AppRoutes.dashboardPaymentView,
    page: () => DashboardPaymentView(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: AppRoutes.orderView,
    page: () => OrderView(),
    binding: OrderBindings(),
  ),
  GetPage(
    name: AppRoutes.orderDetailsView,
    page: () => OrderDetailsView(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: AppRoutes.notificationView,
    page: () => NotificationView(),
    binding: NotificationBindings(),
  ),
  GetPage(
    name: AppRoutes.profileView,
    page: () => ProfileViews(),
    binding: ProfileBindings(),
  ),
  GetPage(
    name: AppRoutes.profileSettingView,
    page: () => ProfileSettingView(),
    binding: ProfileBindings(),
  ),
  GetPage(
    name: AppRoutes.sellView,
    page: () => SellView(),
    binding: SellBindings(),
  ),
  GetPage(
    name: AppRoutes.sellDetails,
    page: () => SellDetails(),
    binding: SellBindings(),
  ),
  GetPage(
    name: AppRoutes.aiDesignView,
    page: () => AiDesignView(),
    binding: AiDesignBindings(),
  ),
  GetPage(
    name: AppRoutes.aiDesignDetailsView,
    page: () => AiDesignDetails(),
    binding: AiDesignBindings(),
  ),
  GetPage(
    name: AppRoutes.transactionView,
    page: () => TransactionView(),
    binding: TransactionBindings(),
  ),
  GetPage(
    name: AppRoutes.transactionDetailView,
    page: () => TransactionDetailsView(),
    binding: TransactionBindings(),
  ),
  GetPage(
    name: AppRoutes.creditBalanceView,
    page: () => CreditBalanceView(),
    binding: CreditBalanceBindings(),
  ),
  GetPage(
    name: AppRoutes.supportView,
    page: () => SupportView(),
    binding: SupportBindings(),
  ),
  GetPage(
    name: AppRoutes.paymentView,
    page: () => PaymentView(),
    binding: PaymentBindings(),
  ),
];
