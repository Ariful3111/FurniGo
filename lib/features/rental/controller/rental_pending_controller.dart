import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_appliance.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_delivery.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_details.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_furniture.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_notes.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_period.dart';

class RentalPendingController extends GetxController {
  List pendingWidgets = [
    {'title': 'Property details', 'widgets': PendingDetails()},
    {'title': 'Furniture', 'widgets': PendingFurniture()},
    {'title': 'Appliances', 'widgets': PendingAppliance()},
    {'title': 'Additional Notes', 'widgets': PendingNotes()},
    {'title': 'Rental Period & Budget', 'widgets': PendingPeriod()},
    {'title': 'Delivery & Setup', 'widgets': PendingDelivery()},
  ];
  RxList<bool> isOpenList = <bool>[].obs;
  @override
  void onInit() {
    isOpenList.value = List.generate(pendingWidgets.length, (_) => false);
    super.onInit();
  }
}
