import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_brand_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_type_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_additional_note_view.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_page_count.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_brand_widgets/rent_brand_details.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentBrand extends GetView<RentBrandController> {
  const RentBrand({super.key});

  @override
  Widget build(BuildContext context) {
    RentPropertyTypeController rentPropertyTypeController = Get.find();
    final stepController = Get.find<RentStepController>();
    return SharedContainer(
      child: Column(
        children: [
          FlowPageCount(
            text:
                rentPropertyTypeController.selectedPropertyType.value ==
                    'Residential'
                ? 'Additional Notes'
                : 'Brand Placement',
            pageCount: (stepController.currentIndex.value).toString(),
          ),
          SizedBox(height: 20.h),
          CustomDivider(),
          rentPropertyTypeController.selectedPropertyType.value == 'Residential'
              ? RentAdditionalNoteView()
              : Column(
                  children: [
                    RentHelper.optionContainer(
                      context: context,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomPrimaryText(
                                  text: 'Branding Required?',
                                  fontSize: 14.sp,
                                  color: AppColors.darkTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 4.h),
                                CustomPrimaryText(
                                  text:
                                      'Add your logo, colors, or custom design to furniture and display areas.',
                                  fontSize: 14.sp,
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          Obx(() {
                            return CustomSwitchButton(
                              isOn: controller.isBrand.value,
                              onChanged: (value) {
                                controller.isBrand.value = value;
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Obx(
                      () => AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        child: controller.isBrand.value
                            ? RentBrandDetails()
                            : SizedBox(),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
