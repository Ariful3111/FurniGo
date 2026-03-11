import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';

class CustomDrawerController extends GetxController {
  RxInt selectedItem = 0.obs;
  List drawerItem = [
    {'icon': IconsPath.dashboardNav, 'title': 'Overview', 'page':AppRoutes.bottomNav},
    {'icon': IconsPath.drawerOrder, 'title': 'Orders', 'page':AppRoutes.orderView},
    {'icon': IconsPath.drawerRent, 'title': 'Rentals', 'page':AppRoutes.rentalView},
    {'icon': IconsPath.drawerSell, 'title': 'Sell Quotes', 'page':AppRoutes.sellView},
    {'icon': IconsPath.drawerAi, 'title': 'AI Designs', 'page':AppRoutes.aiDesignView},
    {'icon': IconsPath.drawerCredit, 'title': 'Credit Balance', 'page':'/credit_balance'},
    {'icon': IconsPath.drawerTrans, 'title': 'Transaction', 'page':AppRoutes.transactionView},
    {'icon': IconsPath.drawerPayment, 'title': 'Payment', 'page':'/payment'},
    {'icon': IconsPath.drawerSupport, 'title': 'Support', 'page':'/support'},
    {'icon': IconsPath.drawerSetting, 'title': 'Setting', 'page':'/setting'},
  ];
}
