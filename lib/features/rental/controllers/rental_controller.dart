import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rental/models/rentals_model.dart';
import 'package:zb_dezign/features/rental/repositories/get_rentals_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class RentalController extends GetxController {
  final GetRentalsRepository getRentalsRepository;

  RentalController({required this.getRentalsRepository});

  // Constants
  final List<String> statusList = [
    'All',
    'Active',
    'Pending',
    'Quoted',
    'Completed',
  ];
  final List<String> rentalTableColumn = ['Rental ID', 'Status', 'Action'];
  final int totalPages = 100;

  // State
  final rentals = Rxn<RentalsModel>();
  final isLoading = true.obs;
  final currentPage = 1.obs;
  final statusIndex = 0.obs;
  final expandedList = <bool>[].obs;

  // Search
  final searchController = TextEditingController();
  final searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeListeners();
    fetchRentals();
  }

  void _initializeListeners() {
    // Page changes
    ever(currentPage, (_) => fetchRentals());

    // Search text changes with debounce
    searchController.addListener(() {
      if (searchText.value != searchController.text) {
        searchText.value = searchController.text;
      }
    });

    debounce(searchText, (text) {
      currentPage.value = 1;
      fetchRentals();
    }, time: const Duration(milliseconds: 500));
  }

  Future<void> fetchRentals() async {
    isLoading.value = true;

    final result = await getRentalsRepository.execute(
      search: searchText.value.isNotEmpty ? searchText.value : null,
      status: statusIndex.value > 0 ? statusList[statusIndex.value] : null,
    );

    isLoading.value = false;

    result.fold((error) => ErrorSnackbar.show(description: error.message), (
      data,
    ) {
      rentals.value = data;

      if (data.data != null) {
        expandedList.value = List<bool>.filled(data.data!.length, false);
      }

      if (data.meta?.lastPage != null) {
        currentPage.value = data.meta!.currentPage ?? 1;
      }
    });
  }

  void onStatusChanged({required int index}) {
    statusIndex.value = index;
    currentPage.value = 1;
    fetchRentals();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
