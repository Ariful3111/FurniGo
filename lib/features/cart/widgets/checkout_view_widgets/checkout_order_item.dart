import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/cart/models/order_item_model.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CheckoutOrderItem extends StatelessWidget {
  final OrderItemModel item;

  const CheckoutOrderItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 72.w,
          height: 72.h,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkColor : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.fieldBorderColor),
          ),
          child: Image.asset(item.image, fit: BoxFit.contain),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: item.title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: isDark ? AppColors.whiteColor : AppColors.darkGreyColor,
              ),
              SizedBox(height: 6.h),
              Row(
                children: [
                  CustomPrimaryText(
                    text: item.category,
                    fontSize: 14.sp,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.lightTextColor,
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    width: 1,
                    height: 14,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.lightTextColor,
                  ),
                  SizedBox(width: 8.w),
                  CustomPrimaryText(
                    text: 'Color: ${item.color}',
                    fontSize: 14.sp,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.lightTextColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomPrimaryText(
          text: item.price,
          fontSize: 16.sp,
          color: isDark
              ? AppColors.primaryBorderColor
              : AppColors.darkGreyColor,
        ),
      ],
    );
  }
}
