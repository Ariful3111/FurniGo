import 'package:flutter/material.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingAppliance extends StatelessWidget {
  const PendingAppliance({super.key});

  @override
  Widget build(BuildContext context) {
    var appliance = [
    {
      'title': 'Reception',
      'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)',
    },
    {
      'title': 'Office Floor',
      'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)',
    },
    {
      'title': 'Private Offices',
      'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)',
    },
  ];
    return DetailsRowModel(data: appliance);
  }
}