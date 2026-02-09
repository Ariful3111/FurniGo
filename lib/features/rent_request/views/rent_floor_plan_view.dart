import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_floor_plan_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_floor_plan_widgets/floor_plan_widgets.dart';
import 'package:zb_dezign/features/rent_request/widgets/page_count.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentFloorPlanView extends StatelessWidget {
  const RentFloorPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    RentFloorPlanController floorPlanController = Get.find();
    return Column(
      children: [
        SharedContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: PageCount(text: 'Floor Plan')),
              SizedBox(height: 20.h),
              propertyDivider(),
              SizedBox(height: 24.h),
              CustomPrimaryText(
                text: 'Floorplan & dimensions',
                fontWeight: FontWeight.w600,
                color: AppColors.darkColor,
              ),
              SizedBox(height: 26.h),
              optionContainer(
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
                        color: Color(0xFF6A7282),
                      ),
                    ),
                    Obx(
                      () => CustomSwitchButton(
                        isOn: floorPlanController.isShare.value,
                        onChanged: (value) {
                          floorPlanController.isShare.value = value;
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
