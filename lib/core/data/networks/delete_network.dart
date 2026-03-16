import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:zb_dezign/core/constant/networks_path.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';

class DeleteNetwork {
  String baseUrl = NetworkLinks.baseUrl;
  Future<Either<ErrorModel, bool>> deleteData({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.delete(
        Uri.parse(baseUrl + url),
        headers: headers,
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        return Right(true);
      }

      try {
        return left(
          ErrorModel.fromHttp(
            statusCode: response.statusCode,
            bodyMessage:
                jsonDecode(response.body)["message"] ?? 'Unknown error',
          ),
        );
      } catch (error) {
        return left(ErrorModel.fromUnknown());
      }
    } catch (error) {
      return left(ErrorModel.fromUnknown());
    }
  }
}
