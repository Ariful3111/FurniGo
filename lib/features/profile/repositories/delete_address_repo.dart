import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/core/data/networks/post_without_response.dart';

class DeleteAddressRepository {
  final PostWithoutResponse postWithoutResponse;
  const DeleteAddressRepository({required this.postWithoutResponse});

  Future<Either<ErrorModel, bool>> execute({required int addressID}) async {
    final response = await postWithoutResponse.postData(
      url: "/api/user/addresses/$addressID/delete",
      headers: HeadersManager.getHeaders(),
      body: {},
    );
    return response;
  }
}
