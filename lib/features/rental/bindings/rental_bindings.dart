import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_controller.dart';
import 'package:zb_dezign/features/rental/repositories/get_rentals_repo.dart';

class RentalBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetRentalsRepository(getNetwork: Get.find()));
    Get.lazyPut(() => RentalController(getRentalsRepository: Get.find()));
  }
}
