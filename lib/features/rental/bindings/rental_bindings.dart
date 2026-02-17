import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controller/rental_controller.dart';
import 'package:zb_dezign/features/rental/controller/rental_pending_controller.dart';

class RentalBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RentalController());
    Get.lazyPut(() => RentalPendingController());
  }
}
