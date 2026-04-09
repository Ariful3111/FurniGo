import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/constant/networks_path.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:http/http.dart' as http;

class PostWithoutResponse {
  String baseUrl = NetworkLinks.baseUrl;

  Future<Either<ErrorModel, bool>> postData({
    required String url,
    required Object body,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.post(
        headers: headers ?? {},
        Uri.parse(baseUrl + url),
        body: (body),
      );
      debugPrint(response.body);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        return Right(true);
      }
      debugPrint(response.body);
      try {
        return left(
          ErrorModel.fromHttp(
            statusCode: response.statusCode,
            bodyMessage:
                jsonDecode(response.body)['message'] ?? 'Unknown error',
          ),
        );
      } catch (error) {
        debugPrint(error.toString());
        return left(ErrorModel.fromUnknown());
      }
    } catch (error) {
      debugPrint(error.toString());
      return left(error as ErrorModel);
    }
  }
}
