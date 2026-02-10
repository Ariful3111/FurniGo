import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/post_with_response.dart';
import 'package:zb_dezign/features/auth/models/login_model.dart';

class LoginRepository {
  final PostWithResponse postWithResponse;

  const LoginRepository({required this.postWithResponse});

  Future<Either<ErrorModel, LoginModel>> execute({
    required String email,
    required String password,
  }) async {
    final response = await postWithResponse.postData<LoginModel>(
      url: "/api/auth/login",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"email": email, "password": password}),
      fromJson: (json) => LoginModel.fromJson(json),
    );
    return response;
  }
}
