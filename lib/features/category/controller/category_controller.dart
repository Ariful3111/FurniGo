import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';

class CategoryController extends GetxController {
  List aiOption = [
    {
      'icon': IconsPath.design,
      'title': 'Product Placement',
      'sub': 'Flexible living starts with flexible furniture.',
      'page': AppRoutes.aiView,
    },
    {
      'icon': IconsPath.design,
      'title': 'Interior Design',
      'sub': 'Transform Your Room with AI',
      'page': AppRoutes.aiView,
      
    },
  ];
}
