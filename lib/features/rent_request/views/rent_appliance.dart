import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_request_controller.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_page_count.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_appliance_widgets/rent_appliance_widgets.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentAppliance extends GetView<RentRequestController> {
  const RentAppliance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SharedContainer(child: FlowPageCount(text: 'Appliance', pageCount: controller.currentIndex.value.toString(),)),
        SizedBox(height: 20.h),
        RentApplianceWidgets(),
      ],
    );
  }
}
