import 'package:get/get.dart';
import 'package:zb_dezign/features/payment/controller/payment_controller.dart';

class PaymentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> PaymentController());
  }
}
