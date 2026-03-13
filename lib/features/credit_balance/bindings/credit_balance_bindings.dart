import 'package:get/get.dart';

class CreditBalanceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreditBalanceBindings());
  }
}
