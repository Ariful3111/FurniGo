import 'package:flutter/material.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_transaction_model.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_item.dart';

class CreditTransactionList extends StatelessWidget {
  const CreditTransactionList({super.key});

  

  @override
  Widget build(BuildContext context) {
    final List<CreditTransaction> items = [
    CreditTransaction(
      title: "Room interior design",
      date: "12/12/2025, 5:40 PM",
      amount: -15,
    ),
    CreditTransaction(
      title: "Credit added",
      date: "12/12/2025, 5:40 PM",
      amount: 200,
    ),
    CreditTransaction(
      title: "Product placement",
      date: "12/12/2025, 5:40 PM",
      amount: -20,
    ),
  ];
    return Column(
      children: items
          .map((e) => CreditTransactionItem(transaction: e))
          .toList(),
    );
  }
}
