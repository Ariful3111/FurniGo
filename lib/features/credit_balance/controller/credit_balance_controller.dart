import 'package:get/get.dart';

class CreditBalanceController extends GetxController {
  RxInt selectedItem = 0.obs;
  List<String> cardList = ['25144654564', '6546546464', '365465464456'];
  RxString selectedCard = ''.obs;
}
