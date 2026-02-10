import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/post_with_response.dart';
import 'package:zb_dezign/features/auth/models/forgot_password_model.dart';

class ForgotPasswordRepoSitory {
  final PostWithResponse postWithResponse;

  const ForgotPasswordRepoSitory({required this.postWithResponse});
  Future<Either<ErrorModel, ForgotPasswordModel>> execute({
    required String email,
  }) async {
    final response = await postWithResponse.postData(
      url: '/api/auth/password/forgot',
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode({'email': email}),
      fromJson: (json) => ForgotPasswordModel.fromJson(json),
    );
    return response;
  }
}
