import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/cart/models/order_item_model.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_order_calculation.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_order_item.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CheckoutOrderSummery extends StatelessWidget {
  const CheckoutOrderSummery({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OrderItemModel> items = [
      OrderItemModel(
        title: 'Echo Lounge Chair',
        category: 'Chair',
        color: 'Blue',
        price: '\$320.00',
        image: ImagesPath.chair,
      ),
      OrderItemModel(
        title: 'Luxe Cup Sofa',
        category: 'Table',
        color: 'Black',
        price: '\$180.00',
        image: ImagesPath.chair,
      ),
      OrderItemModel(
        title: 'Aero Floor Lamp',
        category: 'Lamp',
        color: 'Blue',
        price: '\$280.00',
        image: ImagesPath.chair,
      ),
      OrderItemModel(
        title: 'Vivid Desk',
        category: 'Desk',
        color: 'Walnut',
        price: '\$450.00',
        image: ImagesPath.chair,
      ),
    ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.r),
      radius: 16.r,
      color:isDark? AppColors.labelColor: Color(0xFFF4F6F8),
      border: Border.all(color: AppColors.borderColor),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPrimaryText(
                text: 'Order Summary',
                fontWeight: FontWeight.w600,
                color:isDark? AppColors.whiteColor: AppColors.fieldTextColorDark,
              ),
              CustomPrimaryButton(
                text: 'Edit Order',
                onPressed: () {},
                backgroundColor: AppColors.whiteColor,
                border: Border.all(color: AppColors.grayBorderColor),
                borderRadius: BorderRadius.circular(12.r),
                textColor: AppColors.buttonTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
          SizedBox(height: 16),
          Column(
            children: List.generate(
              items.length,
              (index) => Padding(
                padding: EdgeInsets.only(
                  bottom: index == items.length - 1 ? 0 : 16.h,
                ),
                child: CheckoutOrderItem(item: items[index]),
              ),
            ),
          ),
          SizedBox(height: 24.h,),
          CheckoutOrderCalculation()
        ],
      ),
    );
  }
}
