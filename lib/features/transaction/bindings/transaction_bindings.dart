import 'package:get/get.dart';
import 'package:zb_dezign/features/transaction/controller/transaction_controller.dart';

class TransactionBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionController());
  }
}
