import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';
import 'package:zb_dezign/features/order/repositories/get_orders_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class OrderController extends GetxController {
  final GetOrdersRepository getOrdersRepository;
  OrderController({required this.getOrdersRepository});
  TextEditingController searchController = TextEditingController();
  RxBool isSearch = false.obs;
  RxBool isShowInfo = false.obs;
  RxBool isLoading = true.obs;
  final orders = Rxn<OrdersModel>();

  Future<void> getOrders() async {
    final response = await getOrdersRepository.execute();
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        orders.value = data;
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
