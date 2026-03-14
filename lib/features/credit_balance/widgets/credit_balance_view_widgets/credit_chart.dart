import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_chart_model.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CreditChart extends StatelessWidget {
  const CreditChart({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final List<CreditChartModel> data = [
      CreditChartModel("Jun", 40),
      CreditChartModel("Jul", 60),
      CreditChartModel("Aug", 24),
      CreditChartModel("Sep", 20),
      CreditChartModel("Oct", 35),
      CreditChartModel("Nov", 40),
      CreditChartModel("Dec", 70),
    ];
    return SharedContainer(
      height: 160.h,
      padding: EdgeInsets.all(12.r),
      border: Border.all(
        width: 1.r,
        color: isDark
            ? AppColors.darkBorderColor
            : AppColors.primaryBorderColor,
      ),
      radius: 16.r,
      boxShadow: [
        BoxShadow(
          offset: Offset(1, 4),
          blurRadius: 18.3,
          color: AppColors.darkColor.withValues(alpha: 0.05),
        ),
      ],
      child: BarChart(
        BarChartData(
          minY: 0,
          maxY: 80,
          alignment: BarChartAlignment.spaceBetween,
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 20,
                getTitlesWidget: (value, meta) {
                  final int index = value.toInt();
                  if (index < 0 || index >= data.length) {
                    return SizedBox.shrink();
                  }
                  return CustomPrimaryText(
                    text: '${data[index].value}',
                    fontSize: 8,
                    color: AppColors.labelColor,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  final int index = value.toInt();
                  if (index < 0 || index >= data.length) {
                    return const SizedBox.shrink();
                  }
                  final bool isSelected = index == data.length - 1;
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: CustomPrimaryText(
                      text: data[index].month,
                      fontSize: 8,
                      color: isSelected
                          ? AppColors.secondaryColor
                          : AppColors.greyTextColor,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),
          barGroups: data
              .asMap()
              .entries
              .map(
                (entry) => BarChartGroupData(
                  x: entry.key,
                  barsSpace: 0,
                  barRods: [
                    BarChartRodData(
                      toY: entry.value.value.toDouble(),
                      width: 22,
                      color: entry.key == data.length - 1
                          ? const Color(0x1A000000)
                          : const Color(0xFFD4D4D4),
                      borderRadius: BorderRadius.circular(99),
                      borderSide: BorderSide(
                        width: 1.2,
                        color: entry.key == data.length - 1
                            ? const Color(0xFF2DADE2)
                            : const Color(0xFFBABABA),
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
