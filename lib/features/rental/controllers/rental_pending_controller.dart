import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_appliance.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_delivery.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_furniture.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_period.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_property.dart';

class RentalPendingController extends GetxController {
  final pendingWidgets = <Map<String, dynamic>>[].obs;
  final isOpenList = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initializePendingWidgets();
  }

  void _initializePendingWidgets() {
    final controller = Get.find<RentalDetailsController>();
    final rentalDetails = controller.rentalDetails.value;

    if (rentalDetails == null) {
      pendingWidgets.value = [];
      isOpenList.value = [];
      return;
    }

    final isResidential =
        rentalDetails.propertyUse?.toLowerCase() == 'personal';

    pendingWidgets.value = [
      {'title': 'Property details', 'widgets': const PendingProperty()},
      {
        'title': 'Furniture',
        'widgets': const PendingFurniture(),
        'subTitle': 'Please review your request before submitting.',
      },
      {
        'title': 'Appliances',
        'widgets': const PendingAppliance(),
        'subTitle': 'Please review your request before submitting.',
      },
      if (isResidential)
        {'title': 'Additional Notes', 'widgets': const PendingProperty()}
      else
        {
          'title': 'Branding & Customization',
          'widgets': const PendingProperty(),
        },
      {'title': 'Rental Period & Budget', 'widgets': const PendingPeriod()},
      {
        'title': isResidential ? 'Delivery & Setup' : 'Delivery Details',
        'widgets': const PendingDelivery(),
      },
    ];

    isOpenList.value = List.generate(pendingWidgets.length, (_) => false);
  }

  void toggleOpen(int index) {
    if (index >= 0 && index < isOpenList.length) {
      isOpenList[index] = !isOpenList[index];
    }
  }
}
