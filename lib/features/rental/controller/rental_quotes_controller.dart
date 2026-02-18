import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_furniture.dart';

class RentalQuotesController extends GetxController {
  List furniture = [
    {'title': 'Master Bedroom', 'widget': RentalQuotesFurniture()},
    {'title': 'Bedroom 01', 'widget': RentalQuotesFurniture()},
    {'title': 'Living Room', 'widget': RentalQuotesFurniture()},
    {'title': 'Dining Room', 'widget': RentalQuotesFurniture()},
    {'title': 'Kitchen', 'widget': RentalQuotesFurniture()},
  ];
  RxList<bool> isOpen = <bool>[].obs;
  RxBool isApproved = false.obs;
  RxBool isReset = false.obs;
  RxBool isClose = false.obs;
  @override
  void onInit() {
    isOpen.value = List.generate(furniture.length, (_) => false);
    super.onInit();
  }
}
