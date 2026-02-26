import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class CustomDrawerController extends GetxController {
  RxInt selectedItem = 0.obs;
  List drawerItem = [
    {'icon': IconsPath.dashboardNav, 'title': 'OverView'},
    {'icon': IconsPath.drawerOrder, 'title': 'OverView'},
    {'icon': IconsPath.drawerSell, 'title': 'OverView'},
    {'icon': IconsPath.drawerAi, 'title': 'OverView'},
    {'icon': IconsPath.drawerCredit, 'title': 'OverView'},
    {'icon': IconsPath.drawerTrans, 'title': 'OverView'},
    {'icon': IconsPath.drawerPayment, 'title': 'OverView'},
    {'icon': IconsPath.drawerSupport, 'title': 'OverView'},
    {'icon': IconsPath.drawerSetting, 'title': 'OverView'},
  ];
}
