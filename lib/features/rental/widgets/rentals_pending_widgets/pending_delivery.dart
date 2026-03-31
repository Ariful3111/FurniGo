import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingDelivery extends GetWidget<RentalDetailsController> {
  const PendingDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    final details = controller.rentalDetails.value;

    if (details == null) {
      return const SizedBox.shrink();
    }

    List<Map<String, String>> deliveryData = [];

    // Add delivery address
    if (details.deliverySetup?.deliveryAddress != null) {
      deliveryData.add({
        'title': 'Delivery Address',
        'value': details.deliverySetup!.deliveryAddress ?? '',
      });
    }

    // Add contact person
    if (details.deliverySetup?.contactPerson != null) {
      deliveryData.add({
        'title': 'Contact Person',
        'value': details.deliverySetup!.contactPerson ?? '',
      });
    }

    // Add preferred delivery date
    if (details.deliverySetup?.preferredDeliveryDate != null) {
      deliveryData.add({
        'title': 'Preferred Delivery Date',
        'value': details.deliverySetup!.preferredDeliveryDate ?? '',
      });
    }

    // Add access details
    if (details.deliverySetup?.accessDetails != null) {
      final access = details.deliverySetup!.accessDetails!;
      List<String> accessInfo = [];

      if (access.liftAccess == true) {
        accessInfo.add('Lift Access');
      }
      if (access.loadingDockAvailable == true) {
        accessInfo.add('Loading Dock Available');
      }
      if (access.workingHoursRestrictions == true) {
        accessInfo.add('Working Hours Restrictions');
      }

      if (accessInfo.isNotEmpty) {
        deliveryData.add({
          'title': 'Access Details',
          'value': accessInfo.join(', '),
        });
      }
    }

    // Add installation requirement
    if (details.deliverySetup?.isInstallationRequired != null) {
      deliveryData.add({
        'title': 'Installation Required',
        'value': details.deliverySetup!.isInstallationRequired! ? 'Yes' : 'No',
      });
    }

    return DetailsRowModel(data: deliveryData);
  }
}
