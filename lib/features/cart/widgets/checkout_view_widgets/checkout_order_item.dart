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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 72,
          height: 72,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.fieldBorderColor),
          ),
          child: Image.asset(item.image, fit: BoxFit.contain),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: item.title,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.darkGreyColor,
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  CustomPrimaryText(
                    text: item.category,
                    fontSize: 14.sp,
                    color: AppColors.lightTextColor,
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: 1,
                    height: 14,
                    color: AppColors.lightTextColor,
                  ),
                  SizedBox(width: 8),
                  CustomPrimaryText(
                    text: 'Color: ${item.color}',
                    fontSize: 14.sp,
                    color: AppColors.lightTextColor,
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomPrimaryText(
          text: item.price,
          fontSize: 16.sp,
          color: AppColors.darkGreyColor,
        ),
      ],
    );
  }
}
