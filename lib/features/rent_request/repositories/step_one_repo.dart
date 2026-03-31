import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/utils.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/local/storage_service.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/core/data/networks/post_without_response.dart';

class StepOneRepository {
  final PostWithoutResponse postWithoutResponse;
  const StepOneRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({
    required String propertyType,
    required String propertyUse,
  }) async {
    String uuid = await Get.find<StorageService>().read(
      key: Get.find<StorageService>().rentRequestUUID,
    );
    final response = await postWithoutResponse.postData(
      url: "/api/rental-requests/$uuid",
      headers: HeadersManager.getHeaders(isContentType: true),
      body: jsonEncode({
        "step": 1,
        "property_type": propertyType,
        "property_use": propertyUse,
      }),
    );
    return response;
  }
}
