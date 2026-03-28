import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/rental/models/rentals_model.dart';

class GetRentalsRepository {
  final GetNetwork getNetwork;
  const GetRentalsRepository({required this.getNetwork});

  Future<Either<ErrorModel, RentalsModel>> execute({
    String? search,
    String? status,
  }) async {
    // Build query parameters conditionally
    final queryParams = <String, String>{};
    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }
    if (status != null && status.isNotEmpty) {
      queryParams['status'] = status;
    }

    // Build URL with query parameters
    String url = "/api/rental-requests";
    if (queryParams.isNotEmpty) {
      url += "?${Uri(queryParameters: queryParams).query}";
    }

    final response = await getNetwork.getData<RentalsModel>(
      url: url,
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => RentalsModel.fromJson(json),
    );
    return response;
  }
}
