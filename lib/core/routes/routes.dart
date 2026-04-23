import 'package:get/get.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/ai/bindings/ai_bindings.dart';
import 'package:zb_dezign/features/ai/bindings/ai_interior_design_bindings.dart';
import 'package:zb_dezign/features/ai/bindings/ai_product_placement_bindings.dart';
import 'package:zb_dezign/features/ai/bindings/ai_product_placement_regenerate_bindings.dart';
import 'package:zb_dezign/features/ai/views/ai_interior_design_view.dart';
import 'package:zb_dezign/features/ai/views/ai_product_placement_regenerate_view.dart';
import 'package:zb_dezign/features/ai/views/ai_product_placement_view.dart';
import 'package:zb_dezign/features/ai/views/ai_view.dart';
import 'package:zb_dezign/features/category/bindings/category_bindings.dart';
import 'package:zb_dezign/features/category/views/ai_category_view.dart';
import 'package:zb_dezign/features/contact_us/bindings/contact_us_bindings.dart';
import 'package:zb_dezign/features/contact_us/views/contact_us_view.dart';
import 'package:zb_dezign/features/dashboard_ai_design/bindings/dashboard_ai_design_bindings.dart';
import 'package:zb_dezign/features/dashboard_ai_design/views/dashboard_ai_design_details.dart';
import 'package:zb_dezign/features/dashboard_ai_design/views/dashboard_ai_design_view.dart';
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
import 'package:zb_dezign/features/cart/bindings/cart_bindings.dart';
import 'package:zb_dezign/features/cart/bindings/checkout_bindings.dart';
import 'package:zb_dezign/features/cart/views/cart_view.dart';
import 'package:zb_dezign/features/cart/views/checkout_view.dart';
import 'package:zb_dezign/features/credit_balance/bindings/credit_balance_bindings.dart';
import 'package:zb_dezign/features/credit_balance/views/credit_balance_view.dart';
import 'package:zb_dezign/features/dashboard/bindings/dashboard_bindings.dart';
import 'package:zb_dezign/features/dashboard/views/dashboard_payment_view.dart';
import 'package:zb_dezign/features/dashboard/views/dashboard_view.dart';
import 'package:zb_dezign/features/favorites/bindings/favorites_bindings.dart';
import 'package:zb_dezign/features/favorites/views/favorites_view.dart';
import 'package:zb_dezign/features/membership/bindings/subscription_bindings.dart';
import 'package:zb_dezign/features/membership/views/subscription_view.dart';
import 'package:zb_dezign/features/order/bindings/order_bindings.dart';
import 'package:zb_dezign/features/order/bindings/order_details_bindings.dart';
import 'package:zb_dezign/features/order/views/order_details_view.dart';
import 'package:zb_dezign/features/order/views/order_view.dart';
import 'package:zb_dezign/features/home/bindings/home_bindings.dart';
import 'package:zb_dezign/features/home/views/bottom_nav_view.dart';
import 'package:zb_dezign/features/notification/bindings/notification_bindings.dart';
import 'package:zb_dezign/features/notification/views/notification_view.dart';
import 'package:zb_dezign/features/payment/bindings/payment_bindings.dart';
import 'package:zb_dezign/features/payment/views/payment_view.dart';
import 'package:zb_dezign/features/product_details.dart/bindings/product_details_bindings.dart';
import 'package:zb_dezign/features/product_details.dart/views/product_details_view.dart';
import 'package:zb_dezign/features/profile/bindings/profile_bindings.dart';
import 'package:zb_dezign/features/profile/bindings/profile_settings_bindings.dart';
import 'package:zb_dezign/features/profile/views/profile_setting_view.dart';
import 'package:zb_dezign/features/profile/views/profile_views.dart';
import 'package:zb_dezign/features/rent_request/bindings/rent_bindings.dart';
import 'package:zb_dezign/features/rent_request/views/rent_request_view.dart';
import 'package:zb_dezign/features/rental/bindings/rental_bindings.dart';
import 'package:zb_dezign/features/rental/bindings/rental_details_bindings.dart';
import 'package:zb_dezign/features/rental/views/rental_details_view.dart';
import 'package:zb_dezign/features/rental/views/rental_view.dart';
import 'package:zb_dezign/features/sell/bindings/sell_bindings.dart';
import 'package:zb_dezign/features/sell/views/sell_details.dart';
import 'package:zb_dezign/features/sell/views/sell_view.dart';
import 'package:zb_dezign/features/sell_flow/bindings/sell_flow_bindings.dart';
import 'package:zb_dezign/features/sell_flow/views/sell_flow_views.dart';
import 'package:zb_dezign/features/shop/bindings/shop_bindings.dart';
import 'package:zb_dezign/features/shop/views/shop_view.dart';
import 'package:zb_dezign/features/support/bindings/support_bindings.dart';
import 'package:zb_dezign/features/support/views/support_view.dart';
import 'package:zb_dezign/features/terms/bindings/terms_bindings.dart';
import 'package:zb_dezign/features/terms/views/terms_view.dart';
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
    name: AppRoutes.rentalDetailsView,
    page: () => RentalDetailsView(),
    binding: RentalDetailsBindings(),
  ),
  GetPage(
    name: AppRoutes.dashboardView,
    page: () => DashboardView(),
    binding: DashboardBindings(),
  ),
  GetPage(
    name: AppRoutes.bottomNav,
    page: () => BottomNavView(),
    bindings: [
      HomeBindings(),
      DashboardBindings(),
      ProfileBindings(),
      CartBindings(),
    ],
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
    binding: OrderDetailsBindings(),
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
    binding: ProfileSettingsBindings(),
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
    name: AppRoutes.dashboardAiDesignView,
    page: () => DashboardAiDesignView(),
    binding: DashboardAiDesignBindings(),
  ),
  GetPage(
    name: AppRoutes.dashboardAiDesignDetailsView,
    page: () => DashboardAiDesignDetails(),
    binding: DashboardAiDesignBindings(),
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
  GetPage(
    name: AppRoutes.sellFlowView,
    page: () => SellFlowViews(),
    binding: SellFlowBindings(),
  ),
  GetPage(
    name: AppRoutes.productDetailsView,
    page: () => ProductDetailsView(),
    binding: ProductDetailsBindings(),
  ),
  GetPage(
    name: AppRoutes.cartView,
    page: () => CartView(),
    binding: CartBindings(),
  ),
  GetPage(
    name: AppRoutes.checkoutView,
    page: () => CheckoutView(),
    binding: CheckoutBindings(),
  ),
  GetPage(
    name: AppRoutes.shopView,
    page: () => ShopView(),
    binding: ShopBindings(),
  ),
  GetPage(
    name: AppRoutes.favoritesView,
    page: () => FavoritesView(),
    binding: FavoritesBindings(),
  ),
  GetPage(
    name: AppRoutes.aiCategoryView,
    page: () => AiCategoryView(),
    binding: CategoryBindings(),
  ),
  GetPage(name: AppRoutes.aiView, page: () => AiView(), binding: AiBindings()),
  GetPage(
    name: AppRoutes.aiProductPlacementView,
    page: () => AiProductPlacementView(),
    binding: AiProductPlacementBindings(),
  ),
  GetPage(
    name: AppRoutes.aiInteriorDesignView,
    page: () => AiInteriorDesignView(),
    binding: AiInteriorDesignBindings(),
  ),
  GetPage(
    name: AppRoutes.aiProductPlacementRegenerateView,
    page: () => AiProductPlacementRegenerateView(),
    binding: AiProductPlacementRegenerateBindings(),
  ),
  GetPage(
    name: AppRoutes.subscriptionView,
    page: () => SubscriptionView(),
    binding: SubscriptionBindings(),
  ),
  GetPage(
    name: AppRoutes.contactUsView,
    page: () => ContactUsView(),
    binding: ContactUsBindings(),
  ),
  GetPage(
    name: AppRoutes.termsView,
    page: () => TermsView(),
    binding: TermsBindings(),
  ),
];
