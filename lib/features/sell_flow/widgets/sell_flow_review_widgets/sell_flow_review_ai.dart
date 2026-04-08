import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_review_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SellFlowReviewAi extends GetView<SellFlowReviewController> {
  const SellFlowReviewAi({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        SharedContainer(
          padding: EdgeInsets.all(20.r),
          radius: 16.r,
          border: Border.all(color:isDark? AppColors.darkBorderColor:AppColors.borderColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: "AI estimate (preliminary)",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
              ),
              SizedBox(height: 12.h),
              CustomPrimaryText(
                text: "Estimated age (AI)",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color:isDark? AppColors.primaryBorderColor:AppColors.labelColor,
              ),
              SizedBox(height: 2.h),
              CustomPrimaryText(
                text: "2-3 years",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: isDark? AppColors.primaryBorderColor:AppColors.darkTextColor,
              ),
              SizedBox(height: 12.h),
              CustomPrimaryText(
                text: "Preliminary quote range (AI)",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.labelColor,
              ),
              SizedBox(height: 2.h),
              CustomPrimaryText(
                text: "\$400 - \$600",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.successColor,
              ),
              SizedBox(height: 12.h),
              SellFlowHelper().warningBox(
                title:
                    'This is a preliminary estimate. Final offers require admin approval.',
                subtitle: '',
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCheckBox(
                isChecked: controller.isConfirmed.value,
                onChange: (value) {
                  controller.isConfirmed.value = value!;
                },
                color: Color(0xFF00C0E8),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: CustomPrimaryText(
                  text:
                      "I confirm I own this item and can share these images/documents for quoting.",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color:isDark? AppColors.primaryBorderColor: AppColors.lightGreyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
