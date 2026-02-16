import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_property_type_controller.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_review_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/page_count.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_review_widgets/rent_review_model.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentReview extends StatelessWidget {
  const RentReview({super.key});

  @override
  Widget build(BuildContext context) {
    RentReviewController rentReviewController =
        Get.find<RentReviewController>();
    RentPropertyTypeController rentPropertyTypeController = Get.find();

    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: PageCount(text: 'Review & Submit')),
          SizedBox(height: 20.h),
          propertyDivider(),
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
            data: rentReviewController.propertyType,
          ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Property details',
            data: rentReviewController.propertyDetails,
          ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Floorplan & dimensions',
            data: rentReviewController.propertyFloorPlan,
          ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Furniture Requirements',
            data: rentReviewController.propertyFloorPlan,
          ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Items & appliances',
            data: rentReviewController.propertyAppliance,
          ),
          SizedBox(height: 26.h),
          rentPropertyTypeController.selectedPropertyType.value == 'Residential'
              ? RentReviewModel(
                  title: 'Additional Notes',
                  data: rentReviewController.propertyNotes,
                )
              : RentReviewModel(
                  title: 'Branding & Customization',
                  data: rentReviewController.propertyBranding,
                ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Rental Period & Budget',
            data: rentReviewController.propertyPeriod,
          ),
          SizedBox(height: 26.h),
          RentReviewModel(
            title: 'Delivery Details',
            data: rentReviewController.propertyDelivery,
          ),
        ],
      ),
    );
  }
}
