import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_review_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_review_widgets/sell_flow_review_ai.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class SellFlowReview extends GetView<SellFlowReviewController> {
  const SellFlowReview({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: "Review & submit",
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 8.h),
        CustomPrimaryText(
          text: "Product: Chair",
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 4.h),
        CustomPrimaryText(
          text: "Please review your submission before finalizing.",
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.labelColor,
        ),
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: "Item summary",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
              SizedBox(height: 18.h),
              DetailsRowModel(data: controller.itemSummary),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        SellFlowReviewAi()
      ],
    );
  }
}
