import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_type_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_page_count.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentPropertyTypeView extends GetView<RentPropertyTypeController> {
  const RentPropertyTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    final stepController = Get.find<RentStepController>();

    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: FlowPageCount(
              text: 'Property Type',
              pageCount: (stepController.currentIndex.value + 1).toString(),
            ),
          ),
          SizedBox(height: 20.h),
          CustomDivider(),
          SizedBox(height: 24.h),
          CustomPrimaryText(
            text: 'Property Details',
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor,
          ),
          SizedBox(height: 26.h),
          CustomPrimaryText(
            text: 'Property Type *',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkTextColor,
          ),
          SizedBox(height: 8.h),
          CustomDropdownMenu(
            onSelect: (value) {
              controller.selectedPropertyType.value = value!;
            },
            option: controller.properType,
            isSelect: controller.selectedPropertyType,
            label: 'Select Property Type',
          ),
          SizedBox(height: 32.h),
          CustomPrimaryText(
            text: 'Property Use *',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkTextColor,
          ),
          SizedBox(height: 8.h),
          CustomDropdownMenu(
            onSelect: (value) {
              controller.selectedPropertyUse.value = value!;
            },
            option: controller.properUse,
            isSelect: controller.selectedPropertyUse,
            label: 'Select Property Use',
          ),
        ],
      ),
    );
  }
}
