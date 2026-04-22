import 'package:get/get.dart';
import 'package:zb_dezign/features/ai/controller/ai_controller.dart';
import 'package:zb_dezign/features/credit_balance/controller/credit_balance_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/month_dropdown/custom_month_dropdown_controller.dart';

class AiBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AiController());
    Get.lazyPut(() => CreditBalanceController());
    Get.lazyPut(() => CustomMonthDropdownController());
  }
}
