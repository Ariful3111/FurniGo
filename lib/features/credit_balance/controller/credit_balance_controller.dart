import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/credit_balance/models/credit_chart_model.dart';

class CreditBalanceController extends GetxController {
  RxInt selectedItem = 0.obs;
  List<String> cardList = ['25144654564', '6546546464', '365465464456'];
  RxString selectedCard = ''.obs;
  late final RxInt selectedIndex;
  final ScrollController scrollController = ScrollController();
  final List<CreditChartModel> chartData = [
    CreditChartModel("Jun\n2026", 40),
    CreditChartModel("Jul\n2026", 60),
    CreditChartModel("Aug\n2026", 24),
    CreditChartModel("Sep\n2026", 20),
    CreditChartModel("Oct\n2026", 35),
    CreditChartModel("Nov\n2026", 40),
    CreditChartModel("Dec\n2026", 70),
  ];

  static const List<String> _monthAbbr = [
    'jan', 'feb', 'mar', 'apr', 'may', 'jun',
    'jul', 'aug', 'sep', 'oct', 'nov', 'dec',
  ];

  @override
  void onInit() {
    super.onInit();
    selectedIndex = RxInt(_resolveCurrentMonthIndex());
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void selectIndex(int index) {
    selectedIndex.value = index;
  }

  int _resolveCurrentMonthIndex() {
    final now = DateTime.now();
    final String currentAbbr = _monthAbbr[now.month - 1];
    final String currentYear = now.year.toString();

    for (int i = 0; i < chartData.length; i++) {
      final label = (chartData[i].month ?? '').toLowerCase();
      if (label.startsWith(currentAbbr) && label.contains(currentYear)) {
        return i;
      }
    }
    return chartData.length - 1;
  }

  
}