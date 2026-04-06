import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_shipping_delivery.dart';
import 'package:zb_dezign/shared/widgets/shipping_membership_card.dart';

class ProductDetailsShipping extends StatelessWidget {
  const ProductDetailsShipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductDetailsShippingDelivery(),
        SizedBox(height: 16.h),
        ShippingMembershipCard(),
      ],
    );
  }
}