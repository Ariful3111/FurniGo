import 'package:get/get.dart';
import 'package:zb_dezign/features/dashboard/models/recent_order_model.dart';

class DashboardController extends GetxController {
  List<String> dashboardTableColumn = ['Order', 'Status', 'Action'];
  RxList<bool> expandedList = <bool>[].obs;
  
  final List<RecentOrderModel> recentOrderModel = [
    RecentOrderModel(
      id: 'ORD-2024-001',
      eta: 'Dec 16, 2024',
      total: '\$200',
      status: 'Out for delivery',
      action: 'Track',
    ),
    RecentOrderModel(
      id: 'ORD-2024-001',
      eta: 'Dec 16, 2024',
      total: '\$200',
      status: 'Processing',
      action: 'Track',
    ),
    RecentOrderModel(
      id: 'ORD-2024-001',
      eta: 'Dec 16, 2024',
      total: '\$200',
      status: 'Processing',
      action: 'Track',
    ),
  ];
  @override
  void onInit() {
    expandedList.value = List<bool>.filled(recentOrderModel.length, false);
    super.onInit();
  }
}
