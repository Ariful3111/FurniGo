import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/profile/models/user_address_model.dart';

class GetUserAddressRepository {
  final GetNetwork getNetwork;
  const GetUserAddressRepository({required this.getNetwork});

  Future<Either<ErrorModel, UserAddressModel>> execute() async {
    final response = await getNetwork.getData<UserAddressModel>(
      url: "/api/user/addresses",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => UserAddressModel.fromJson(json),
    );
    return response;
  }
}
