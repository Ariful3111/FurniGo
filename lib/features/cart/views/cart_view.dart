import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/features/cart/widgets/cart_item.dart';
import 'package:zb_dezign/features/cart/widgets/cart_select_item.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(title: 'Cart', onDrawerTap: () {}, isIcon: false),
          SizedBox(height: 32.h),
           CartSelectItem(),

        SizedBox(height: 16),

        ////////////////////////////////////////////////////////////
        /// LIST
        ////////////////////////////////////////////////////////////

        Obx(() => ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.cartList.length,
              separatorBuilder: (_, __) => Divider(
                color: AppColors.borderColor,
              ),
              itemBuilder: (context, index) {
                final item = controller.cartList[index];

                return  CartItem(
                      item: item,
                      index: index,
                      controller: controller,
                      isDark: isDark,
                    );
              },
            )),
        ],
      ),
    );
  }
}
