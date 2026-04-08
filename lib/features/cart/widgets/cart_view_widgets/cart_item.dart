import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/features/cart/models/cart_item_model.dart';
import 'package:zb_dezign/features/cart/widgets/cart_view_widgets/cart_item_info.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;
  final CartController controller;
  final int index;
  final bool isDark;

  const CartItem({
    super.key,
    required this.item,
    required this.index,
    required this.isDark,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CartItemInfo(item: item, controller: controller, index: index,),
            SizedBox(width: 12.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _qtyButton(
                      icon: Icons.remove,
                      onTap: () => controller.decreaseQty(index),
                    ),
                    SizedBox(width: 8),
                    CustomPrimaryText(text: item.quantity.toString(), fontSize: 16.sp),
                    SizedBox(width: 8),
                    _qtyButton(
                      icon: Icons.add,
                      onTap: () => controller.increaseQty(index),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () => controller.deleteItem(index),
                  child: Container(
                    height: 32.h,
                    width: 32.w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border: Border.all(color: AppColors.fieldBorderColor),
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Image.asset(IconsPath.delete, height: 14.h, width: 14.w)),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.h,),
        CustomDivider(),
      ],
    );
  }

  Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.h,
        height: 30.w,
        decoration: BoxDecoration(
          color: AppColors.fieldBorderColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}
