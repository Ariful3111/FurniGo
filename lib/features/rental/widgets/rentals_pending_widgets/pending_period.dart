import 'package:flutter/material.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingPeriod extends StatelessWidget {
  const PendingPeriod({super.key});

  @override
  Widget build(BuildContext context) {
    var period = [
    {'title': 'Rental term (days)', 'value': '60 days'},
    {'title': 'Payment Type', 'value': 'Pay in instalments'},
    {'title': 'Discount', 'value': '10%'},
  ];
    return DetailsRowModel(data: period,);
  }
}