import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/core/data/networks/post_without_response.dart';

class UpdateAddressRepository {
  final PostWithoutResponse postWithoutResponse;
  const UpdateAddressRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required int addressID,
    required bool isDefault,
  }) async {
    final response = await postWithoutResponse.postData(
      url: "/api/user/addresses/$addressID/update",
      headers: HeadersManager.getHeaders(isContentType: true),
      body: jsonEncode({"is_default": isDefault}),
    );
    return response;
  }
}
