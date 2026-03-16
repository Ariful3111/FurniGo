import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/home/models/products_model.dart';

class GetNewArrivalsRepository {
  final GetNetwork getNetwork;
  const GetNewArrivalsRepository({required this.getNetwork});

  Future<Either<ErrorModel, ProductsModel>> execute() async {
    final response = await getNetwork.getData<ProductsModel>(
      url: "/api/products?new_arrival=true",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => ProductsModel.fromJson(json),
    );
    return response;
  }
}
