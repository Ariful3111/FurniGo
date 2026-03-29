import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/post_with_response.dart';
import 'package:zb_dezign/features/auth/models/google_login_model.dart';

class GoogleLoginRepository {
  final PostWithResponse postWithResponse;
  const GoogleLoginRepository({required this.postWithResponse});

  Future<Either<ErrorModel, GoogleLoginModel>> execute({
    required String name,
    required String email,
    required String avatar,
    required String token,
  }) async {
    final response = await postWithResponse.postData<GoogleLoginModel>(
      url: "/api/auth",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"name": name, "email": email, "avatar": avatar}),
      fromJson: (json) => GoogleLoginModel.fromJson(json),
    );
    return response;
  }
}
