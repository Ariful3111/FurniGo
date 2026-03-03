import 'package:get/get.dart';
import 'package:zb_dezign/features/notification/controller/notification_controller.dart';

class NotificationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
