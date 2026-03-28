import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_delivery_detail_widgets/home_pick_address.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_delivery_detail_widgets/home_pick_delivery_date.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_delivery_detail_widgets/home_pick_delivery_time.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_helper.dart';

class SellFlowDeliveryHomePick extends StatelessWidget {
  const SellFlowDeliveryHomePick({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomePickAddress(),
        SizedBox(height: 20.h),
        HomePickDeliveryDate(),
        SizedBox(height: 12.h),
        HomePickDeliveryTime(),
        SizedBox(height: 24.h),
        SellFlowHelper().warningBox(
          title: 'Our team will inspect the item during pickup.',
          subtitle: 'Final payment is processed after verification.',
        ),
      ],
    );
  }
}
