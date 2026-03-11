import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/sell/models/sell_model.dart';

class SellController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt selectedIndex = 0.obs;
  List<String> filter = [
    'All',
    'Offer Ready',
    'In Review',
    'Accepted',
    'Received', 
  ];

  RxList<bool> expandedList = <bool>[].obs;
  RxInt currentPage = 1.obs;
  final int totalPages = 100;
  List<String> sellTableColumn = ['Sell ID', 'Status', 'Action'];
  final List<SellModel> sell = [
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'Offer Accepted',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Received',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'Offer Ready',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Received',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'In Review',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Received',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'Received',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Received',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'Accepted',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Received',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'Accepted',
      offer: '\$450.00',
      shipment: 'Pending',
      payment: 'Received',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'Accepted',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Pending',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'Offer Ready',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Received',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'Offer Ready',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Received',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'In Review',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Received',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'Offer Accepted',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Received',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'Offer Ready',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Received',
    ),
    SellModel(
      id: 'SEL-2024-001',
      item: 'Oak Dining Table',
      submitDate: 'Dec 10, 2024',
      status: 'In Review',
      offer: '\$450.00',
      shipment: 'Delivered',
      payment: 'Received',
    ),
  ];
  RxList<SellModel> get filteredSell {
    if (selectedIndex.value == 0) {
      return sell.obs;
    }
    final selectedStatus = filter[selectedIndex.value];
    return sell
        .where((sell) {
          return sell.status == selectedStatus;
        })
        .toList()
        .obs;
  }

  @override
  void onInit() {
    super.onInit();
    ever(filteredSell, (List<SellModel> list) {
      expandedList.value = List<bool>.filled(list.length, false);
    });
    expandedList.value = List<bool>.filled(filteredSell.length, false);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
