import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/core/data/networks/post_without_response.dart';

class ToggleFavouriteRepository {
  final PostWithoutResponse postWithoutResponse;
  const ToggleFavouriteRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({required int productID}) async {
    final response = await postWithoutResponse.postData(
      url: "/api/favourites/toggle",
      headers: HeadersManager.getHeaders(isContentType: true),
      body: jsonEncode({"product_id": productID}),
    );
    return response;
  }
}
