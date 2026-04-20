import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/dashboard_ai_design/models/ai_design_model.dart';

class DashboardAiDesignController extends GetxController {
  List<String> category = ['All', 'AI Product Placement', 'AI Interior Design'];
  TextEditingController searchController = TextEditingController();
  RxInt selectedIndex = 0.obs;
  RxList<bool> expandedList = <bool>[].obs;
  RxInt currentPage = 1.obs;
  final int totalPages = 100;
  List<String> aiTableColumn = ['Generation ID', 'Type', 'Action'];
  final List<AiDesignModel> ai = [
    AiDesignModel(
      id: 'Img123456789',
      type: 'Product Placement',
      generateDate: '04, September, 2025',
    ),
    AiDesignModel(
      id: 'Img123456789',
      type: 'AI Interior Design',
      generateDate: '04, September, 2025',
    ),
    AiDesignModel(
      id: ' Img123456789',
      type: 'Product Placement',
      generateDate: '04, September, 2025',
    ),
    AiDesignModel(
      id: 'Img123456789',
      type: 'AI Interior Design',
      generateDate: '04, September, 2025',
    ),
    AiDesignModel(
      id: 'Img123456789',
      type: 'Product Placement',
      generateDate: '04, September, 2025',
    ),
  ];
  RxList<AiDesignModel> get filteredAi {
    if (selectedIndex.value == 0) {
      return ai.obs;
    }
    final selectedStatus = category[selectedIndex.value];
    return ai
        .where((ai) {
          if (selectedStatus == 'AI Product Placement') {
            return ai.type == 'Product Placement';
          }
          return ai.type == selectedStatus;
        })
        .toList()
        .obs;
  }

  @override
  void onInit() {
    super.onInit();
    ever(filteredAi, (List<AiDesignModel> list) {
      expandedList.value = List<bool>.filled(list.length, false);
    });
    expandedList.value = List<bool>.filled(filteredAi.length, false);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
