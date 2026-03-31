import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_type_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_review_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_page_count.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_review_widgets/rent_review_model.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentReview extends GetView<RentReviewController> {
  const RentReview({super.key});

  @override
  Widget build(BuildContext context) {
    RentPropertyTypeController rentPropertyTypeController = Get.find();
    final stepController = Get.find<RentStepController>();

    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: FlowPageCount(
              text: 'Review & Submit',
              pageCount: (stepController.currentIndex.value + 1).toString(),
            ),
          ),
          SizedBox(height: 20.h),
          CustomDivider(),
          SizedBox(height: 24.h),
          CustomPrimaryText(
            text: 'Review & submit',
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor,
          ),
          SizedBox(height: 12.h),
          CustomPrimaryText(
            text: 'Please review your request before submitting.',
            fontSize: 14.sp,
            color: AppColors.greyTextColor,
          ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Property Type',
            data: controller.propertyType,
          ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Property details',
            data: controller.propertyDetails,
          ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Floorplan & dimensions',
            data: controller.propertyFloorPlan,
          ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Furniture Requirements',
            data: controller.propertyFloorPlan,
          ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Items & appliances',
            data: controller.propertyAppliance,
          ),
          SizedBox(height: 26.h),
          rentPropertyTypeController.selectedPropertyType.value == 'Residential'
              ? RentReviewModel(
                  title: 'Additional Notes',
                  data: controller.propertyNotes,
                )
              : RentReviewModel(
                  title: 'Branding & Customization',
                  data: controller.propertyBranding,
                ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Rental Period & Budget',
            data: controller.propertyPeriod,
          ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Delivery Details',
            data: controller.propertyDelivery,
          ),
        ],
      ),
    );
  }
}
