import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/global_models/user_profile_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';

class GetProfileRepository {
  final GetNetwork getNetwork;
  const GetProfileRepository({required this.getNetwork});

  Future<Either<ErrorModel, UserProfileModel>> execute() async {
    final response = await getNetwork.getData<UserProfileModel>(
      url: "/api/auth/me",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => UserProfileModel.fromJson(json),
    );
    return response;
  }
}
