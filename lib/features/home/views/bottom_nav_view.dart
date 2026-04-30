import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/features/home/controller/bottom_nav_controller.dart';
import 'package:zb_dezign/features/home/widgets/bottom_nav_widgets/bottom_nav_cart_item.dart';
import 'package:zb_dezign/features/home/widgets/bottom_nav_widgets/bottom_nav_dashboard_item.dart';
import 'package:zb_dezign/features/home/widgets/bottom_nav_widgets/bottom_nav_items.dart';
import 'package:zb_dezign/features/home/widgets/bottom_nav_widgets/bottom_nav_profile_item.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [controller.pages[controller.selectedIndex.value]],
        ),
        bottomNavigationBar: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              margin: EdgeInsets.all(25.r),
              width: MediaQuery.widthOf(context),
              height: 66.h,
              decoration: BoxDecoration(
                color: isDark ? AppColors.labelColor : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkColor,
                    blurRadius: 20,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: BottomNavItems(
                      icon: IconsPath.home,
                      label: 'Home',
                      index: 0,
                    ),
                  ),
                  Expanded(
                    child: BottomNavItems(
                      icon: IconsPath.categoryNav,
                      label: 'Category',
                      index: 1,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Expanded(
                    child: Obx(() {
                      final cartController = Get.find<CartController>();
                      final count =
                          cartController.carts.value?.items?.length ?? 0;
                      return BottomNavCartItem(
                        key: ValueKey(count),
                        icon: IconsPath.cart,
                        label: 'Cart',
                        index: 3,
                        badgeCount: count.toString(),
                      );
                    }),
                  ),
                  Expanded(child: BottomNavProfileItem(index: 4)),
                ],
              ),
            ),
            Positioned(bottom: 50.h, child: BottomNavDashboardItem()),
          ],
        ),
      ),
    );
  }
}
