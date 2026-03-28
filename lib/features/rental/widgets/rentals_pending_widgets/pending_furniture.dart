import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_furniture_widget.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingFurniture extends StatelessWidget {
  const PendingFurniture({super.key});

  @override
  Widget build(BuildContext context) {
    final detailsController = Get.find<RentalDetailsController>();
    final quotesController = Get.find<RentalQuotesController>();
    final rentalDetails = detailsController.rentalDetails.value;

    final furnitureSelection = rentalDetails?.furnitureSelection ?? [];

    final furniture = furnitureSelection
        .map(
          (selection) => {
            'title': selection.room ?? 'Unknown Room',
            'value':
                selection.items
                    ?.map((item) => '${item.name} (${item.count})')
                    .join(', ') ??
                'No items',
          },
        )
        .toList();

    return rentalDetails?.status?.capitalizeFirst == 'Quote Sent'
        ? RentalQuotesFurnitureWidget(
            itemList: quotesController.furniture,
            isOpen: quotesController.isOpen,
          )
        : DetailsRowModel(data: furniture);
  }
}
