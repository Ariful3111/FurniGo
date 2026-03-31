import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/home/models/products_model.dart';
import 'package:zb_dezign/features/home/repositories/global_search_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class GlobalSearchController extends GetxController {
  final GlobalSearchRepository globalSearchRepository;
  GlobalSearchController({required this.globalSearchRepository});

  TextEditingController searchController = TextEditingController();
  final searchResults = Rxn<ProductsModel>();
  RxBool isLoading = false.obs;
  RxBool showSuggestions = false.obs;
  RxString searchText = ''.obs;
  final FocusNode searchFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    _initializeListeners();
  }

  void _initializeListeners() {
    // Listen to search controller changes
    searchController.addListener(() {
      if (searchText.value != searchController.text) {
        searchText.value = searchController.text;
      }

      // Show/hide suggestions based on text
      showSuggestions.value = searchController.text.isNotEmpty;
    });

    // Debounce search
    debounce(searchText, (text) {
      if (text.isNotEmpty) {
        search(query: text);
      } else {
        searchResults.value = null;
      }
    }, time: const Duration(milliseconds: 500));
  }

  Future<void> search({required String query}) async {
    isLoading.value = true;
    final response = await globalSearchRepository.execute(query: query);
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
        searchResults.value = null;
      },
      (data) {
        searchResults.value = data;
      },
    );
  }

  void clearSearch() {
    searchController.clear();
    searchText.value = '';
    searchResults.value = null;
    showSuggestions.value = false;
  }

  @override
  void onClose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.onClose();
  }
}
