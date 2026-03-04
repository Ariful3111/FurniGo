import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class ProfileController extends GetxController {
  List profileList = [
    {'icon':IconsPath.dashboardNav,'title':'Dashboard',},
    {'icon':IconsPath.profile,'title':'Profile & Settings',},
    {'icon':IconsPath.profileNotification,'title':'Notifications',},
    {'icon':IconsPath.profileMode,'title':'Switch Mode',},
    {'icon':IconsPath.profileBalance,'title':'Credit Balance',},
    {'icon':IconsPath.profileOrder,'title':'My Orders',},
    {'icon':IconsPath.profileSubs,'title':'Subscription and Membership',},
    {'icon':IconsPath.profileContact,'title':'Contact Us',},
    {'icon':IconsPath.profileSupport,'title':'Support',},
    {'icon':IconsPath.profilePrivacy,'title':'Privacy Policy',},
  ];
}
