import 'package:get/get.dart';
import 'package:zb_dezign/features/credit_balance/controller/credit_balance_controller.dart';

class CreditBalanceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreditBalanceController());
  }
}
