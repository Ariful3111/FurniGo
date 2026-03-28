import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_delivery_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_delivery_detail_widgets/sell_flow_delivery_home_pick.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_delivery_detail_widgets/sell_flow_delivery_option.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_delivery_detail_widgets/sell_flow_delivery_self_drop.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';

class SellFlowDeliveryDetail extends GetView<SellFlowDeliveryController> {
  const SellFlowDeliveryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SellFlowDeliveryOption(),
        SizedBox(height: 20.h),
        CustomDivider(),
        SizedBox(height: 20.h),
        Obx(
          () => AnimatedSize(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: controller.selectedIndex.value == 0
                ? SellFlowDeliveryHomePick(key: ValueKey('Home'),)
                : SellFlowDeliverySelfDrop(key: ValueKey('Self'),),
          ),
        ),
      ],
    );
  }
}
