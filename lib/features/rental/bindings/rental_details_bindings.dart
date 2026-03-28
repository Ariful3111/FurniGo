import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_active_controller.dart';
import 'package:zb_dezign/features/rental/controllers/rental_pending_controller.dart';
import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/controllers/rentals_complete_controller.dart';

class RentalDetailsBindings implements Bindings {
  @override
  void dependencies() {
    // Controllers specifically needed for rental details view
    Get.lazyPut(() => RentalPendingController());
    Get.lazyPut(() => RentalQuotesController());
    Get.lazyPut(() => RentalsCompleteController());
    Get.lazyPut(() => RentalActiveController());
  }
}
