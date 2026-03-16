import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/home/models/rooms_model.dart';

class GetRoomsRepository {
  final GetNetwork getNetwork;
  const GetRoomsRepository({required this.getNetwork});

  Future<Either<ErrorModel, RoomsModel>> execute() async {
    final response = await getNetwork.getData<RoomsModel>(
      url: "/api/rooms",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => RoomsModel.fromJson(json),
    );
    return response;
  }
}
