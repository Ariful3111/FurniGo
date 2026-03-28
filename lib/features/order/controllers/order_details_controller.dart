import 'package:get/get.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';
import 'package:zb_dezign/features/order/repositories/get_order_details_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class OrderDetailsController extends GetxController {
  final GetOrderDetailsRepository getOrderDetailsRepository;
  OrderDetailsController({required this.getOrderDetailsRepository});
  RxBool isLoading = true.obs;
  final order = Rxn<OrderData>();

  @override
  void onInit() {
    super.onInit();
    fetchOrderDetails(orderID: Get.arguments.toString());
  }

  Future<void> fetchOrderDetails({required String orderID}) async {
    final response = await getOrderDetailsRepository.execute(orderID: orderID);
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        order.value = data;
      },
    );
  }
}
