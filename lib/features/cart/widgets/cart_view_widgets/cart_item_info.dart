import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/controller/cart_controller.dart';
import 'package:zb_dezign/features/cart/models/cart_model.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CartItemInfo extends GetWidget<CartController> {
  final CartItem item;
  const CartItemInfo({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 90,
            height: 80,
            decoration: BoxDecoration(
              color: isDark ? AppColors.labelColor : Color(0xFFEFEFEF),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              children: [
                Center(
                  child: CachedNetworkImage(
                    imageUrl:
                        item.product?.media
                            ?.firstWhere((media) => media.type == "image")
                            .url ??
                        '',
                    height: 70.h,
                    width: 77.w,
                  ),
                ),
                Positioned(
                  top: 0.h,
                  left: 0.w,
                  child: Obx(
                    () => CustomCheckBox(
                      borderColor: isDark
                          ? AppColors.primaryBorderColor
                          : AppColors.darkColor,
                      isChecked: item.isSelected,
                      onChange: (value) {
                        controller.toggleItem(id: item.id ?? 0);
                      },
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
                  text: item.product?.name ?? '',
                  fontSize: 14.sp,
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.darkGreyColor,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: item.product?.category?.name ?? '',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.lightTextColor,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text:
                      "${item.options?.first.attributeName ?? ''}: ${item.options?.first.optionName ?? ''}",
                  fontSize: 12.sp,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.lightTextColor,
                ),
                SizedBox(height: 4),
                CustomPrimaryText(
                  text:
                      "\$${(item.product?.finalPrice ?? 0).toStringAsFixed(2)}",
                  fontSize: 14.sp,
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.darkGreyColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
