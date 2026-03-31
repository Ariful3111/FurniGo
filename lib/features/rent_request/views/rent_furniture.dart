import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_page_count.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_furniture_widgets/rent_furniture_widgets.dart';

class RentFurniture extends GetView<RentRequestController> {
  const RentFurniture({super.key});

  @override
  Widget build(BuildContext context) {
    final stepController = Get.find<RentStepController>();

    return Column(
      children: [
        SharedContainer(
          child: FlowPageCount(
            text: 'Furniture Requirements',
            pageCount: (stepController.currentIndex.value + 1).toString(),
          ),
        ),
        SizedBox(height: 20.h),
        RentFurnitureWidgets(),
      ],
    );
  }
}
