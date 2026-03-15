import 'package:get/get.dart';
import 'package:zb_dezign/features/transaction/controller/transaction_controller.dart';
import 'package:zb_dezign/features/transaction/controller/transaction_details_controller.dart';

class TransactionBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TransactionController());
    Get.lazyPut(() => TransactionDetailsController());
  }
}
