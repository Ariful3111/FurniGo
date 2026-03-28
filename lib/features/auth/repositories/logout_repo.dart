import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/core/data/networks/post_without_response.dart';

class LogoutRepository {
  final PostWithoutResponse postWithoutResponse;
  const LogoutRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute() async {
    final response = await postWithoutResponse.postData(
      url: "/api/auth/logout",
      headers: HeadersManager.getHeaders(isContentType: true),
      body: jsonEncode({}),
    );
    return response;
  }
}
