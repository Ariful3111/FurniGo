import 'package:get/get.dart';
import 'package:zb_dezign/features/dashboard/views/dashboard_view.dart';
import 'package:zb_dezign/features/home/views/home_view.dart';

class BottomNavController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final List pages = [
    HomeView(),
    DashboardView(),
    DashboardView(),
    DashboardView(),
    DashboardView(),
  ];
}
