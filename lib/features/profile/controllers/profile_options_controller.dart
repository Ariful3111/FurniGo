import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';

class ProfileOptionsController extends GetxController {
  List profileList = [
    {
      'icon': IconsPath.profileCategory,
      'title': 'Dashboard',
    },
    {
      'icon': IconsPath.profile,
      'title': 'Profile & Settings',
      'route': AppRoutes.profileSettingView,
    },
    {
      'icon': IconsPath.profileNotification,
      'title': 'Notifications',
      'route': AppRoutes.notificationView,
    },
    {'icon': IconsPath.profileMode, 'title': 'Switch Mode'},
    {
      'icon': IconsPath.profileBalance,
      'title': 'Credit Balance',
      'route': AppRoutes.creditBalanceView,
    },
    {
      'icon': IconsPath.profileOrder,
      'title': 'My Orders',
      'route': AppRoutes.orderView,
    },
    {'icon': IconsPath.profileSubs, 'title': 'Subscription and Membership'},
    {'icon': IconsPath.profileContact, 'title': 'Contact Us'},
    {
      'icon': IconsPath.profileSupport,
      'title': 'Support',
      'route': AppRoutes.supportView,
    },
    {'icon': IconsPath.profilePrivacy, 'title': 'Privacy Policy'},
  ];
}
