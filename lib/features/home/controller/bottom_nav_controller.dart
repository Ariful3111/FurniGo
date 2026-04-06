import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/views/cart_view.dart';
import 'package:zb_dezign/features/category/views/category_view.dart';
import 'package:zb_dezign/features/dashboard/views/dashboard_view.dart';
import 'package:zb_dezign/features/home/views/home_view.dart';
import 'package:zb_dezign/features/profile/views/profile_views.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final List pages = [
    HomeView(),
    CategoryView(),
    DashboardView(),
    CartView(),
    ProfileViews(),
  ];
}
