import 'package:get/get.dart';

class ProfileSettingController extends GetxController {
  List notification = [
    {
      'title': 'Order updates',
      'sub': 'Get notified about order status changes',
      'isOn': false.obs,
    },
    {
      'title': 'Rental updates',
      'sub': 'Get notified about order status changes',
      'isOn': false.obs,
    },
    {
      'title': 'Quote updates',
      'sub': 'Get alerts when quotes are ready',
      'isOn': false.obs,
    },
    {
      'title': 'Promotions',
      'sub': 'Receive marketing emails and special offers',
      'isOn': false.obs,
    },
  ];
}
