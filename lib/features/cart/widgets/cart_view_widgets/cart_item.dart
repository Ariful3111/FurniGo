import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/features/cart/models/cart_model.dart';
import 'package:zb_dezign/features/cart/widgets/cart_view_widgets/cart_item_info.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CartItemBox extends GetWidget<CartController> {
  final CartItem item;
  final bool isDark;

  const CartItemBox({super.key, required this.item, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CartItemInfo(item: item),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _qtyButton(
                      icon: Icons.remove,
                      onTap: () {
                        controller.decreaseQty(id: item.id ?? 0);
                      },
                    ),
                    SizedBox(width: 8),
                    CustomPrimaryText(
                      text: (item.quantity ?? 0).toString(),
                      fontSize: 16.sp,
                    ),
                    SizedBox(width: 8),
                    _qtyButton(
                      icon: Icons.add,
                      onTap: () {
                        controller.increaseQty(id: item.id ?? 0);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    controller.deleteItem(id: item.id ?? 0);
                  },
                  child: Container(
                    height: 32.h,
                    width: 32.w,
                    decoration: BoxDecoration(
                      color: isDark
                          ? AppColors.labelColor
                          : AppColors.whiteColor,
                      border: Border.all(
                        color: isDark
                            ? AppColors.darkBorderColor
                            : AppColors.fieldBorderColor,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        IconsPath.delete,
                        height: 14.h,
                        width: 14.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.h),
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
          color: isDark ? AppColors.labelColor : AppColors.fieldBorderColor,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}
