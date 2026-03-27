import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/home/models/product_types_model.dart';

class GetProductTypeRepository {
  final GetNetwork getNetwork;
  const GetProductTypeRepository({required this.getNetwork});

  Future<Either<ErrorModel, ProductTypesModel>> execute() async {
    final response = await getNetwork.getData<ProductTypesModel>(
      url: "/api/furniture-types",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => ProductTypesModel.fromJson(json),
    );
    return response;
  }
}
