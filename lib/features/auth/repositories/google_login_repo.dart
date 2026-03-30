import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/post_without_response.dart';

class GoogleLoginRepository {
  final PostWithoutResponse postWithResponse;
  const GoogleLoginRepository({required this.postWithResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String name,
    required String email,
    required String avatar,
    required String token,
  }) async {
    final response = await postWithResponse.postData(
      url: "/api/auth",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"name": name, "email": email, "avatar": avatar}),
    );
    return response;
  }
}
