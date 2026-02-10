import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/constant/networks_path.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:http/http.dart' as http;

class PostWithResponse {
  String baseUrl = NetworkLinks.baseUrl;
  Future<Either<ErrorModel, T>> postData<T>({
    required String url,
    required Map<String, String> headers,
    required Object body,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(baseUrl + url),
        headers: headers,
        body: (body),
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        return Right(fromJson(jsonDecode(response.body)));
        
      }
      // ignore: avoid_print
      print(response.body);
      try {
        return left(
          ErrorModel.fromHttp(
            statusCode: response.statusCode,
            bodyMessage:
                jsonDecode(response.body)['message'] ?? 'Unknown error',
          ),
        );
      } catch (error) {
        return left(ErrorModel.fromUnknown());
      }
    } catch (error) {
      return left(error as ErrorModel);
    }
  }
}
