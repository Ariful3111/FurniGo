// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';
// import 'package:zb_dezign/features/rental/models/rentals_model.dart';
// import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_furniture_widget.dart';
// import 'package:zb_dezign/shared/widgets/details_row_model.dart';

// class PendingAppliance extends GetWidget<RentalQuotesController> {
//   const PendingAppliance({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var appliance = [
//       {
//         'title': 'Reception',
//         'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)',
//       },
//       {
//         'title': 'Office Floor',
//         'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)',
//       },
//       {
//         'title': 'Private Offices',
//         'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)',
//       },
//     ];
//     return rentalModel.status == 'Quote Sent'
//         ? RentalQuotesFurnitureWidget(
//             itemList: controller.appliance,
//             isOpen: controller.isOpenAppliance,
//           )
//         : DetailsRowModel(data: appliance);
//   }
// }
