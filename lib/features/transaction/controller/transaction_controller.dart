import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/transaction/models/transaction_model.dart';

class TransactionController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<bool> expandedList = <bool>[].obs;
  RxInt currentPage = 1.obs;
  final int totalPages = 100;
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
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
