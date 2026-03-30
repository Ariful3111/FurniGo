import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_floor_plan_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_floor_plan_widgets/floor_plan_widgets.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_page_count.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentFloorPlanView extends GetView<RentFloorPlanController> {
  const RentFloorPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    RentRequestController rentRequestController = Get.find();
    return Column(
      children: [
        SharedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: FlowPageCount(
                  text: 'Floor Plan',
                  pageCount: rentRequestController.currentIndex.value
                      .toString(),
                ),
              ),
              SizedBox(height: 20.h),
              CustomDivider(),
              SizedBox(height: 24.h),
              CustomPrimaryText(
                text: 'Floorplan & dimensions',
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor,
              ),
              SizedBox(height: 26.h),
              RentHelper().optionContainer(
                context: context,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomPrimaryText(
                        text:
                            'Sharing your floor plan helps us design your space faster and more accurately.',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor,
                      ),
                    ),
                    Obx(
                      () => CustomSwitchButton(
                        isOn: controller.isShare.value,
                        onChanged: (value) {
                          controller.isShare.value = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        FloorPlanWidgets(),
      ],
    );
  }
}
