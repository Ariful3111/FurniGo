import 'package:fpdart/fpdart.dart';
import 'package:zb_dezign/core/data/global_models/error_model.dart';
import 'package:zb_dezign/core/data/networks/get_network.dart';
import 'package:zb_dezign/core/data/networks/headers_manager.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';

class GetOrderDetailsRepository {
  final GetNetwork getNetwork;
  const GetOrderDetailsRepository({required this.getNetwork});

  Future<Either<ErrorModel, OrderData>> execute({
    required String orderID,
  }) async {
    final response = await getNetwork.getData<OrderData>(
      url: "/api/orders/$orderID",
      headers: HeadersManager.getHeaders(),
      fromJson: (json) =>
          OrderData.fromJson(json['data'] as Map<String, dynamic>),
    );
    return response;
  }
}
