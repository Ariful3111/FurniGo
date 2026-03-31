import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/core/data/networks/post_with_response.dart';
import 'package:zb_dezign/features/rent_request/models/step_zero_model.dart';

class StepZeroRepository {
  final PostWithResponse postWithResponse;
  const StepZeroRepository({required this.postWithResponse});

  Future<Either<ErrorModel, StepZeroModel>> execute({
    required String businessName,
    required String contactPerson,
    required String email,
    required String phone,
    required String abn,
    required String website,
  }) async {
    final response = await postWithResponse.postData<StepZeroModel>(
      url: "/api/rental-requests",
      headers: HeadersManager.getHeaders(isContentType: true),
      body: jsonEncode({
        "business_name": businessName,
        "contact_person": contactPerson,
        "email": email,
        "phone": phone,
        "abn": abn,
        "website": website,
      }),
      fromJson: (json) => StepZeroModel.fromJson(json),
    );
    return response;
  }
}
