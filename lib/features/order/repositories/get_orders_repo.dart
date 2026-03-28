import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';

class GetOrdersRepository {
  final GetNetwork getNetwork;
  const GetOrdersRepository({required this.getNetwork});

  Future<Either<ErrorModel, OrdersModel>> execute() async {
    final response = await getNetwork.getData<OrdersModel>(
      url: "/api/orders",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) => OrdersModel.fromJson(json),
    );
    return response;
  }
}
