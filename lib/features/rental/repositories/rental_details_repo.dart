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
    final response = await getNetwork.getData<RentalDetailsModel>(
      url: "/api/rental-requests/$rentalRequestUuid",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => RentalDetailsModel.fromJson(json),
    );
    return response;
  }
}
