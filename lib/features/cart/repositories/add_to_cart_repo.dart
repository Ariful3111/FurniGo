import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/core/data/networks/post_without_response.dart';

class AddToCartRepository {
  final PostWithoutResponse postWithoutResponse;
  const AddToCartRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required int productID,
    required int quantity,
    required List<int> options,
  }) async {
    final response = await postWithoutResponse.postData(
      url: "/api/cart/add",
      headers: HeadersManager.getHeaders(isContentType: true),
      body: jsonEncode({
        "product_id": productID,
        "quantity": quantity,
        "options": options,
      }),
    );
    return response;
  }
}
