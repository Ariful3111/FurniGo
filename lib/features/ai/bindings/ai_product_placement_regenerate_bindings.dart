import 'package:get/get.dart';
import 'package:zb_dezign/features/ai/controller/ai_controller.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_regenerate_controller.dart';
import 'package:zb_dezign/features/category/controller/category_controller.dart';
import 'package:zb_dezign/features/credit_balance/controller/credit_balance_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/month_dropdown/custom_month_dropdown_controller.dart';

class AiProductPlacementRegenerateBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => CreditBalanceController());
    Get.lazyPut(() => CustomMonthDropdownController());
    Get.lazyPut(() => AiController());
    Get.lazyPut(() => AiProductPlacementRegenerateController());
  }
}
