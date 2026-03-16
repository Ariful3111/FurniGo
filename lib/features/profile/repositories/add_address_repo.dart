import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/core/data/networks/post_without_response.dart';

class AddAddressRepository {
  final PostWithoutResponse postWithoutResponse;
  const AddAddressRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String name,
    required String phone,
    required String addressLine1,
    required String addressLine2,
    required String city,
    required String state,
    required String postalCode,
    required String country,
    required String type,
    required bool isDefault,
  }) async {
    final response = await postWithoutResponse.postData(
      url: "/api/user/addresses",
      headers: HeadersManager.getHeaders(isContentType: true),
      body: jsonEncode({
        "name": name,
        "phone": phone,
        "address_line_1": addressLine1,
        "address_line_2": addressLine2,
        "city": city,
        "state": state,
        "postal_code": postalCode,
        "country": country,
        "type": type,
        "is_default": isDefault,
      }),
    );
    return response;
  }
}
