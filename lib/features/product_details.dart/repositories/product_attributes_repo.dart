import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/product_details.dart/models/product_attributes_model.dart';

class ProductAttributesRepository {
  final GetNetwork getNetwork;
  const ProductAttributesRepository({required this.getNetwork});

  Future<Either<ErrorModel, ProductAttributesModel>> execute({
    required int productID,
  }) async {
    final response = await getNetwork.getData<ProductAttributesModel>(
      url: "/api/products/$productID/attributes",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => ProductAttributesModel.fromJson(json),
    );
    return response;
  }
}
