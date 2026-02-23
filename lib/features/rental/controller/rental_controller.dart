import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:zb_dezign/features/rental/model/rental_model.dart';

class RentalController extends GetxController {
  List<String> statusList = ['All', 'Active', 'Pending', 'Quoted', 'Completed'];
  RxInt statusIndex = 0.obs;
  TextEditingController searchController = TextEditingController();
  RxList<bool> expandedList = <bool>[].obs;
  RxInt currentPage = 1.obs;
  final int totalPages = 100;
  List<String> rentalTableColumn = ['Rental ID', 'Status', 'Action'];
  final List<RentalModel> rentals = [
    RentalModel(
      id: 'RNT-2023-012',
      propertyType: 'Commercial Office',
      startDate: 'Jun 1, 2024',
      endDate: 'Nov 30, 2024',
      status: 'Pending',
      shipment: 'N/A',
      payment: 'N/A',
    ),
    RentalModel(
      id: 'RNT-2023-012',
      propertyType: 'Commercial Office',
      startDate: 'Jun 1, 2024',
      endDate: 'Nov 30, 2024',
      status: 'Quote Sent',
      shipment: 'N/A',
      payment: 'N/A',
    ),
    RentalModel(
      id: 'RNT-2023-012',
      propertyType: 'Commercial Office',
      startDate: 'Jun 1, 2024',
      endDate: 'Nov 30, 2024',
      status: 'Revise Quote',
      shipment: 'N/A',
      payment: 'N/A',
    ),
    RentalModel(
      id: 'RNT-2023-012',
      propertyType: 'Commercial Office',
      startDate: 'Jun 1, 2024',
      endDate: 'Nov 30, 2024',
      status: 'Active',
      shipment: 'N/A',
      payment: 'N/A',
    ),
    RentalModel(
      id: 'RNT-2023-012',
      propertyType: 'Commercial Office',
      startDate: 'Jun 1, 2024',
      endDate: 'Nov 30, 2024',
      status: 'Completed',
      shipment: 'N/A',
      payment: 'N/A',
    ),
    RentalModel(
      id: 'RNT-2023-012',
      propertyType: 'Commercial Office',
      startDate: 'Jun 1, 2024',
      endDate: 'Nov 30, 2024',
      status: 'Rejected',
      shipment: 'N/A',
      payment: 'N/A',
    ),
  ];

  RxList<RentalModel> get filteredRentals {
    if (statusIndex.value == 0) {
      return rentals.obs;
    }
    final selectedStatus = statusList[statusIndex.value];
    return rentals
        .where((rental) {
          if (selectedStatus == 'Quoted') {
            return rental.status == 'Quote Sent' ||
                rental.status == 'Revise Quote';
          }
          return rental.status == selectedStatus;
        })
        .toList()
        .obs;
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize expandedList based on filteredRentals length
    ever(filteredRentals, (List<RentalModel> list) {
      expandedList.value = List<bool>.filled(list.length, false);
    });
    // Trigger initial population
    expandedList.value = List<bool>.filled(filteredRentals.length, false);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
