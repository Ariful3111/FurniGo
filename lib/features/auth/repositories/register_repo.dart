import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/post_with_response.dart';
import 'package:zb_dezign/features/auth/models/register_model.dart';

class RegisterRepository {
  final PostWithResponse postWithResponse;

  const RegisterRepository({required this.postWithResponse});

  Future<Either<ErrorModel, RegisterModel>> execute({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required String abn,
    required String userType,
  }) async {
    final response = await postWithResponse.postData<RegisterModel>(
      url: "/api/auth/$userType/register",
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": confirmPassword,
        if (abn.isNotEmpty) "abn": abn,
      }),
      fromJson: (json) => RegisterModel.fromJson(json),
    );
    return response;
  }
}
