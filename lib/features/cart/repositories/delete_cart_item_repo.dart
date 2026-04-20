import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/core/data/networks/post_without_response.dart';

class DeleteCartItemRepository {
  final PostWithoutResponse postWithoutResponse;
  const DeleteCartItemRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required int cartItemID,
    required String cartID,
  }) async {
    final response = await postWithoutResponse.postData(
      url: "/api/cart/item/$cartItemID/remove",
      headers: HeadersManager.getHeaders(isContentType: true),
      body: jsonEncode({"cart_id": cartID}),
    );
    return response;
  }
}
