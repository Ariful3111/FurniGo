import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/core/data/networks/post_without_response.dart';

class OrderReviewRepository {
  final PostWithoutResponse postWithoutResponse;
  const OrderReviewRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String orderID,
    required double ratings,
    required String review,
  }) async {
    final response = await postWithoutResponse.postData(
      url: "/api/reviews",
      headers: HeadersManager.getHeaders(isContentType: true),
      body: jsonEncode({
        "order_id": orderID,
        "rating": ratings,
        "title": "Product Review",
        "review": review,
      }),
    );
    return response;
  }
}
