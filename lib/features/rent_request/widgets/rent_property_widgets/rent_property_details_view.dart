import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_details_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/add_item_dialog.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/rent_property_details_list.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_page_count.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_add_button.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/property_details_field.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentPropertyDetailsView extends GetView<RentPropertyDetailsController> {

  const RentPropertyDetailsView({super.key,});

  @override
  Widget build(BuildContext context) {
    final stepController = Get.find<RentStepController>();

    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: FlowPageCount(
              text: 'Property Details',
              pageCount: (stepController.currentIndex.value).toString(),
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
          SizedBox(height: 20.h),
          PropertyDetailsField(),
          SizedBox(height: 20.h),
          CustomPrimaryText(
            text: 'Space Breakdown',
            fontSize: 16.sp,
            color: AppColors.darkTextColor,
          ),
          SizedBox(height: 16.h),
          RentPropertyDetailsList(),
          SizedBox(height: 20.h),
          PropertyAddButton(
            text: 'Add Item',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AddItemDialog(
                  onTap: () {
                    final text = controller.itemController.text.trim();
                    if (text.isEmpty) {
                      return;
                    }
                    controller.addSpaceBreakdownItem(text);
                    controller.itemController.clear();
                    Navigator.pop(context);
                  },
                  controller: controller.itemController,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
