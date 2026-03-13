import 'package:flutter/material.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_chart.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_hedar.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_transaction_list.dart';

class CreditUsageCard extends StatelessWidget {
  const CreditUsageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x26000000),
            blurRadius: 30,
            offset: Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CreditHeader(),
          SizedBox(height: 20),
          CreditChart(),
          SizedBox(height: 24),
          CreditTransactionList(),
        ],
      ),
    );
  }
}
