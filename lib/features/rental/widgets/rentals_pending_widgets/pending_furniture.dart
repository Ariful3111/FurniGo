import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingFurniture extends GetWidget<RentalDetailsController> {
  const PendingFurniture({super.key});

  @override
  Widget build(BuildContext context) {
    final details = controller.rentalDetails.value;

    if (details == null ||
        details.furnitureSelection == null ||
        details.furnitureSelection!.isEmpty) {
      return const SizedBox.shrink();
    }

    List<Map<String, String>> furnitureData = [];

    for (var furnitureSelection in details.furnitureSelection!) {
      String itemsValue = '';
      if (furnitureSelection.items != null &&
          furnitureSelection.items!.isNotEmpty) {
        itemsValue = furnitureSelection.items!
            .map((item) => '${item.name} (${item.count})')
            .join(', ');
      }

      String value = itemsValue;
      if (furnitureSelection.condition != null) {
        value += '\nCondition: ${furnitureSelection.condition}';
      }
      if (furnitureSelection.style != null) {
        value += '\nStyle: ${furnitureSelection.style}';
      }

      furnitureData.add({
        'title': furnitureSelection.room ?? '',
        'value': value,
      });
    }

    return DetailsRowModel(data: furnitureData);
  }
}
