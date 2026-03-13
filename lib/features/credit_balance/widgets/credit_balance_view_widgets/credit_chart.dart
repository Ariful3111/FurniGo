import 'package:flutter/material.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_chart_model.dart';
import 'package:zb_dezign/features/credit_balance/widgets/credit_balance_view_widgets/credit_bar.dart';

class CreditChart extends StatelessWidget {
  const CreditChart({super.key});

  

  @override
  Widget build(BuildContext context) {
    final List<CreditChartModel> data = [
    CreditChartModel("Jun", 40),
    CreditChartModel("Jul", 60),
    CreditChartModel("Aug", 24),
    CreditChartModel("Sep", 20),
    CreditChartModel("Oct", 35),
    CreditChartModel("Nov", 40),
    CreditChartModel("Dec", 70),
  ];
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE9E9E9)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: data
            .map((e) => CreditBar(
                  value: e.value,
                  month: e.month,
                ))
            .toList(),
      ),
    );
  }
}
