import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/favorites/models/favourite_model.dart';

class GetFavoriteRepository {
  final GetNetwork getNetwork;
  const GetFavoriteRepository({required this.getNetwork});

  Future<Either<ErrorModel, FavouriteModel>> execute() async {
    final response = await getNetwork.getData<FavouriteModel>(
      url: "/api/favourites",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => FavouriteModel.fromJson(json),
    );
    return response;
  }
}
