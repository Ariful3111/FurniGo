import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/product_details.dart/models/product_details_model.dart';

class ProductDetailsRepository {
  final GetNetwork getNetwork;
  const ProductDetailsRepository({required this.getNetwork});

  Future<Either<ErrorModel, ProductDetailsModel>> execute({
    required int productID,
  }) async {
    final response = await getNetwork.getData<ProductDetailsModel>(
      url: "/api/products/$productID",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => ProductDetailsModel.fromJson(json),
    );
    return response;
  }
}
