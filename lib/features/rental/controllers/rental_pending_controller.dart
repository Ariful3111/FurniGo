import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_property.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_furniture.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_appliance.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_notes.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_period.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/pending_delivery.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_pending_widgets/commercial_pending/commercial_pending_branding.dart';

class RentalPendingController extends GetxController {
  final RentalDetailsController rentalDetailsController = Get.find();

  late List pendingWidgets;
  RxList<bool> isOpenList = <bool>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Determine if it's residential or commercial based on property use
    bool isResident =
        rentalDetailsController.rentalDetails.value?.propertyUse
            ?.toLowerCase() ==
        'personal';

    pendingWidgets = [
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
      isResident
          ? {'title': 'Additional Notes', 'widgets': const PendingNotes()}
          : {
              'title': 'Branding & Customization',
              'widgets': const CommercialPendingBranding(),
            },
      {'title': 'Rental Period & Budget', 'widgets': const PendingPeriod()},
      {
        'title': isResident ? 'Delivery & Setup' : 'Delivery Details',
        'widgets': const PendingDelivery(),
      },
    ];
    isOpenList.value = List.generate(pendingWidgets.length, (_) => false);
  }
}
