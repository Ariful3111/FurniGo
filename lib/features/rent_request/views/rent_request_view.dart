import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_header.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_request_view_widgets/rent_request_next.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_step_count.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentRequestView extends GetView<RentRequestController> {
  const RentRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    final stepController = Get.find<RentStepController>();

    return CustomContainer(
      child: ListView(
        controller: controller.rentController,
        children: [
          SizedBox(height: 20.h),
          CustomAppbar(
            title: 'Rent',
            onDrawerTap: () {
              Navigator.pop(context);
            },
            icon: IconsPath.back,
          ),
          SizedBox(height: 32.h),
          FlowHeader(
            title: 'Rent',
            sub: 'Flexible living starts with flexible furniture.',
          ),
          SizedBox(height: 16.h),
          Obx(() => stepController.getCurrentWidget()),
          SizedBox(height: 20.h),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (stepController.currentIndex.value > 0)
                  RentHelper.myButton(
                    border: Border.all(
                      color: AppColors.buttonBorderColor,
                      width: 1.r,
                    ),
                    onTap: () {
                      stepController.goToPreviousStep();
                    },
                    child: CustomPrimaryText(
                      text: 'Previous',
                      fontSize: 12.sp,
                      color: AppColors.labelColor,
                    ),
                  ),
                stepController.currentIndex.value > 0
                    ? FlowStepCount(
                        currentPage: (stepController.currentIndex.value + 1)
                            .toString(),
                        totalPage: stepController.totalSteps.toString(),
                      )
                    : SizedBox.shrink(),
                RentRequestNext(),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
