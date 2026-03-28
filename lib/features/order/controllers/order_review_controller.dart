import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';
import 'package:zb_dezign/features/order/repositories/order_review_repo.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';
import 'package:zb_dezign/shared/widgets/snackbars/success_snackbar.dart';

class OrderReviewController extends GetxController {
  final OrderReviewRepository orderReviewRepository;
  OrderReviewController({required this.orderReviewRepository});
  TextEditingController ratingController = TextEditingController();
  RxDouble rating = 0.0.obs;
  RxBool isLoading = false.obs;
  final order = Rxn<OrderData>();

  Future<void> submitReview({required String orderID}) async {
    if (rating.value == 0.0) {
      ErrorSnackbar.show(description: "Please rate a review");
      return;
    }
    if (ratingController.text.isEmpty) {
      ErrorSnackbar.show(description: "Please write a review");
      return;
    }
    isLoading.value = true;
    final response = await orderReviewRepository.execute(
      orderID: orderID,
      ratings: rating.value,
      review: ratingController.text,
    );
    isLoading.value = false;
    response.fold(
      (error) {
        ErrorSnackbar.show(description: error.message);
      },
      (data) {
        Get.back();
        SuccessSnackbar.show(description: "Review submitted successfully");
      },
    );
  }
}
