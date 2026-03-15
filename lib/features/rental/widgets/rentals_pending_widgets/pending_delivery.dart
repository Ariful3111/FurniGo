import 'package:flutter/material.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingDelivery extends StatelessWidget {
  const PendingDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    var delivery = [
      {'title': 'Delivery Time', 'value': '10 days'},
      {'title': 'Return Time', 'value': '10 days'},
    ];
    return DetailsRowModel(data: delivery,);
  }
}
