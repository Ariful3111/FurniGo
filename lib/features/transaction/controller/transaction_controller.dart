import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/transaction/models/transaction_model.dart';

class TransactionController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<bool> expandedList = <bool>[].obs;
  RxInt currentPage = 1.obs;
  final int totalPages = 100;
  final RxString selectedRangeType = 'Custom'.obs;
  final Rxn<DateTime> fromDate = Rxn<DateTime>();
  final Rxn<DateTime> toDate = Rxn<DateTime>();
  List<String> transTableColumn = ['Transaction ID', 'Status', 'Action'];
  final List<TransactionModel> transaction = [
    TransactionModel(
      id: '4654654654',
      type: 'Order',
      date: '04, September, 2025',
      status: 'Success',
      amount: '-\$12.00',
      method: 'Mastercard',
    ),
    TransactionModel(
      id: '4654654654',
      type: 'Order',
      date: '04, September, 2025',
      status: 'Success',
      amount: '-\$12.00',
      method: 'Mastercard',
    ),
    TransactionModel(
      id: '4654654654',
      type: 'Order',
      date: '04, September, 2025',
      status: 'Success',
      amount: '-\$12.00',
      method: 'Mastercard',
    ),
    TransactionModel(
      id: '4654654654',
      type: 'Order',
      date: '04, September, 2025',
      status: 'Success',
      amount: '-\$12.00',
      method: 'Mastercard',
    ),
    TransactionModel(
      id: '4654654654',
      type: 'Order',
      date: '04, September, 2025',
      status: 'Success',
      amount: '-\$12.00',
      method: 'Mastercard',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    expandedList.value = List<bool>.filled(transaction.length, false);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    fromDate.value = today;
    toDate.value = today;
  }

  void applyDateRange({
    required String rangeType,
    required DateTime from,
    required DateTime to,
  }) {
    final a = DateTime(from.year, from.month, from.day);
    final b = DateTime(to.year, to.month, to.day);
    if (a.isAfter(b)) {
      fromDate.value = b;
      toDate.value = a;
    } else {
      fromDate.value = a;
      toDate.value = b;
    }
    selectedRangeType.value = rangeType;
  }

  String formatDate(DateTime? date) {
    if (date == null) return '--/--/----';
    final d = date.day.toString().padLeft(2, '0');
    final m = date.month.toString().padLeft(2, '0');
    final y = date.year.toString();
    return '$d/$m/$y';
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
