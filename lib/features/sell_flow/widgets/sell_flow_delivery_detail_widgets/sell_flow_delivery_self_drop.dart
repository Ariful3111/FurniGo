import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_delivery_detail_widgets/self_drop_location.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_delivery_detail_widgets/self_drop_schedule.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';

class SellFlowDeliverySelfDrop extends StatelessWidget {
  const SellFlowDeliverySelfDrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SelfDropLocation(),
        SizedBox(height: 20.h,),
        CustomDivider(),
        SizedBox(height: 20.h,),
        SelfDropSchedule()
      ],
    );
  }
}