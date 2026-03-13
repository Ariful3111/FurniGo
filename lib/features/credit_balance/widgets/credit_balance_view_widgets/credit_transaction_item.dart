import 'package:flutter/material.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_transaction_model.dart';

class CreditTransactionItem extends StatelessWidget {
  final CreditTransaction transaction;

  const CreditTransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    bool isPositive = transaction.amount > 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Text(
                transaction.date,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "${isPositive ? "+" : ""}${transaction.amount}",
            ),
          )
        ],
      ),
    );
  }
}
