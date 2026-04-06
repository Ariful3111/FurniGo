import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/features/cart/models/cart_item_model.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
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
    return Row(
      children: [
        Obx(
          () => CustomCheckBox(
            isChecked: item.isSelected.value,
            onChange: (_) => controller.toggleItem(index),
          ),
        ),
        SizedBox(width: 12),
        Container(
          width: 90,
          height: 80,
          decoration: BoxDecoration(
            color:  Color(0xFFEFEFEF),
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              image: AssetImage(item.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: item.name,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              CustomPrimaryText(text: item.category, fontSize: 12),
              CustomPrimaryText(text: "Color: ${item.color}", fontSize: 12),
              SizedBox(height: 4),
              CustomPrimaryText(
                text: "\$${item.price}",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),

        /// RIGHT SIDE
        Column(
          children: [
            /// QUANTITY
            Row(
              children: [
                _qtyButton(
                  icon: Icons.remove,
                  onTap: () => controller.decreaseQty(index),
                ),
                SizedBox(width: 8),
                CustomPrimaryText(text: item.quantity.toString(), fontSize: 16),
                SizedBox(width: 8),
                _qtyButton(
                  icon: Icons.add,
                  onTap: () => controller.increaseQty(index),
                ),
              ],
            ),

            SizedBox(height: 12),

            /// DELETE
            GestureDetector(
              onTap: () => controller.deleteItem(index),
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.delete, size: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}
