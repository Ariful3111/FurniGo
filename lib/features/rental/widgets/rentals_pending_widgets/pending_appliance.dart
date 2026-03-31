import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingAppliance extends GetWidget<RentalDetailsController> {
  const PendingAppliance({super.key});

  @override
  Widget build(BuildContext context) {
    final details = controller.rentalDetails.value;

    if (details == null ||
        details.applianceSelection == null ||
        details.applianceSelection!.isEmpty) {
      return const SizedBox.shrink();
    }

    List<Map<String, String>> applianceData = [];

    for (var applianceSelection in details.applianceSelection!) {
      String itemsValue = '';
      if (applianceSelection.items != null &&
          applianceSelection.items!.isNotEmpty) {
        itemsValue = applianceSelection.items!
            .map((item) => '${item.name} (${item.count})')
            .join(', ');
      }

      applianceData.add({
        'title': applianceSelection.room ?? '',
        'value': itemsValue,
      });
    }

    return DetailsRowModel(data: applianceData);
  }
}
