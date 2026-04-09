import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';

class QuickActionList {
  List quickAction = [
    {
      'icon': IconsPath.shopProduction,
      'title': 'Shop Products',
      'sub': 'Brand-new pieces with fast delivery and easy setup.',
      'page': AppRoutes.shopView,
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
      'page': AppRoutes.aiCategoryView,
    },
  ];
}