import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/rental/models/rental_details_model.dart';

class RentalDetailsRepository {
  final GetNetwork getNetwork;
  const RentalDetailsRepository({required this.getNetwork});

  Future<Either<ErrorModel, RentalDetailsModel>> execute({
    required String rentalRequestUuid,
  }) async {
    final response = await getNetwork.getData<Map<String, dynamic>>(
      url: "/api/rental-requests/$rentalRequestUuid",
      headers: HeadersManager.getHeaders(isContentType: true),
      fromJson: (json) => json,
    );

    return response.fold((error) => Left(error), (rawJson) {
      if (rawJson.containsKey('data')) {
        final data = rawJson['data'];
        return Right(RentalDetailsModel.fromJson(data as Map<String, dynamic>));
      } else {
        return Right(RentalDetailsModel.fromJson(rawJson));
      }
    });
  }
}
