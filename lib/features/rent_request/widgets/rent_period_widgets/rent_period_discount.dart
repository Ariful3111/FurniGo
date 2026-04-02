import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_period_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_page_count.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_period_widgets/rent_period_discount_payment.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_period_widgets/rent_period_suggestion.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentPeriodDiscount extends GetWidget<RentPeriodController> {
  const RentPeriodDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    final stepController = Get.find<RentStepController>();
    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: FlowPageCount(
              text: 'Rental Period & Budget',
              pageCount: (stepController.currentIndex.value + 1).toString(),
            ),
          ),
          SizedBox(height: 20.h),
          CustomDivider(),
          SizedBox(height: 44.h),
          CustomPrimaryText(
            text: 'Rental term (days) *',
            color: AppColors.titleTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
          SizedBox(height: 8.h),
          RentPeriodSuggestion(),
          SizedBox(height: 8.h),
          CustomPrimaryText(
            text: 'Discount tiers apply automatically.',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.greyColor,
          ),
          SizedBox(height: 12.h),
          Obx(
            () => AnimatedSize(
              duration: Duration(milliseconds: 300),
              child: controller.selectedRentPeriodTitle.value == '30 Days'
                  ? SizedBox()
                  : Container(
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        color: Color(0xFFE6FBF7),
                        border: Border.all(
                          width: 1.01.r,
                          color: Color(0xFF00DAB2),
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            IconsPath.discount,
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Obx(
                              () => CustomPrimaryText(
                                text:
                                    'A ${controller.getDiscount(controller.selectedRentPeriodTitle.value)} discount has been applied for selecting a ${controller.selectedRentPeriodTitle.value} rental period.',
                                color: Color(0xFF212121),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
          SizedBox(height: 32.h),
          RentPeriodDiscountPayment(),
        ],
      ),
    );
  }
}
