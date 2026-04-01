import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/dashboard/models/recent_order_model.dart';

class DashboardController extends GetxController {
  List<String> dashboardTableColumn = ['Order', 'Status', 'Action'];
  RxList<bool> expandedList = <bool>[].obs;
  List quickAction = [
    {
      'icon': IconsPath.shopProduction,
      'title': 'Shop Products',
      'sub': 'Brand-new pieces with fast delivery and easy setup.',
      'page': '',
    },
    {
      'icon': IconsPath.sellFurniture,
      'title': 'Sell Furniture',
      'sub': 'Get a fair offer fast pickup included.',
      'page': AppRoutes.sellFlowView,
    },
    {
      'icon': IconsPath.rentProduct,
      'title': 'Rent Products',
      'sub': 'Brand-new pieces with fast delivery and easy setup.',
      'page': AppRoutes.rentRequestView,
    },
    {
      'icon': IconsPath.design,
      'title': 'Design My Room',
      'sub': 'Brand-new pieces with fast delivery and easy setup.',
      'page': '',
    },
  ];
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
