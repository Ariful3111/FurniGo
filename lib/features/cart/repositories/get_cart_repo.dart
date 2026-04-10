import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/cart/models/cart_model.dart';

class GetCartRepository {
  final GetNetwork getNetwork;
  const GetCartRepository({required this.getNetwork});

  Future<Either<ErrorModel, CartModel>> execute() async {
    final response = await getNetwork.getData<CartModel>(
      url: "/api/cart",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => CartModel.fromJson(json),
    );
    return response;
  }
}
