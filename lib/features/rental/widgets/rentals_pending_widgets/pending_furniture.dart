// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';
// import 'package:zb_dezign/features/rental/models/rentals_model.dart';
// import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_furniture_widget.dart';
// import 'package:zb_dezign/shared/widgets/details_row_model.dart';

// class PendingFurniture extends GetWidget<RentalQuotesController> {
//   const PendingFurniture({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var furniture = [
//       {'title': 'Office Floor', 'value': 'Length (1 sqm)*Width (1 sqm)'},
//       {'title': 'Private Offices', 'value': 'Length (1 sqm)*Width (1 sqm)'},
//       {'title': 'Kitchen', 'value': 'Length (1 sqm)*Width (1 sqm)'},
//     ];
//     return rentalModel.status == 'Quote Sent'
//         ? RentalQuotesFurnitureWidget(
//             itemList: controller.furniture,
//             isOpen: controller.isOpen,
//           )
//         : DetailsRowModel(data: furniture);
//   }
// }
