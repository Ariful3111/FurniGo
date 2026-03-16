import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/home/models/products_model.dart';

class GetProductsByTypeRepository {
  final GetNetwork getNetwork;
  const GetProductsByTypeRepository({required this.getNetwork});

  Future<Either<ErrorModel, ProductsModel>> execute({
    required int typeID,
  }) async {
    final response = await getNetwork.getData<ProductsModel>(
      url: "/api/products?new_arrival=false&furniture_type_id=$typeID",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => ProductsModel.fromJson(json),
    );
    return response;
  }
}
