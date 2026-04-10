import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/features/cart/widgets/cart_view_widgets/cart_item.dart';
import 'package:zb_dezign/features/cart/widgets/cart_view_widgets/cart_order_summery.dart';
import 'package:zb_dezign/features/cart/widgets/cart_view_widgets/cart_select_item.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return CustomContainer(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [AppColors.darkColor, AppColors.darkColor]
              : [AppColors.whiteColor, AppColors.whiteColor],
        ),
        child: controller.isLoading.value
            ? ButtonLoading()
            : ListView(
                children: [
                  CustomAppbar(
                    title: 'Cart',
                    onDrawerTap: () {},
                    isIcon: false,
                  ),
                  SizedBox(height: 32.h),
                  CartSelectItem(),
                  SizedBox(height: 16),
                  Obx(
                    () => ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.carts.value?.items?.length ?? 0,
                      separatorBuilder: (_, _) => Column(
                        children: [
                          Divider(color: AppColors.borderColor),
                          SizedBox(height: 12.h),
                        ],
                      ),
                      itemBuilder: (context, index) {
                        final item = controller.carts.value?.items?[index];
                        if (item == null) return SizedBox.shrink();
                        return CartItemBox(item: item, isDark: isDark);
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CartOrderSummery(),
                ],
              ),
      );
    });
  }
}
