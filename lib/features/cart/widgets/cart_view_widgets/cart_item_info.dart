import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/features/cart/models/cart_item_model.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CartItemInfo extends StatelessWidget {
  final CartItemModel item;
  final CartController controller;
  final int index;
  const CartItemInfo({
    super.key,
    required this.item,
    required this.controller,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 90,
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xFFEFEFEF),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(item.image, height: 70.h, width: 77.w),
                ),
                Positioned(
                  top: 0.h,
                  left: 0.w,
                  child: Obx(
                    () => CustomCheckBox(
                      isChecked: item.isSelected.value,
                      onChange: (_) => controller.toggleItem(index),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryText(
                  text: item.name,
                  fontSize: 14.sp,
                  color: AppColors.darkGreyColor,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: item.category,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightTextColor,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: "Color: ${item.color}",
                  fontSize: 12.sp,
                  color: AppColors.lightTextColor,
                ),
                SizedBox(height: 4),
                CustomPrimaryText(
                  text: "\$${item.price}",
                  fontSize: 14.sp,
                  color: AppColors.darkGreyColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
