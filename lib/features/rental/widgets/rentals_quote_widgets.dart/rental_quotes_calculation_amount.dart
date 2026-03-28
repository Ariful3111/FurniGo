import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/accept_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_reject_dialog.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/revision_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalQuotesCalculationAmount extends GetWidget<RentalQuotesController> {
  final double totalAmount;

  const RentalQuotesCalculationAmount({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final detailsController = Get.find<RentalDetailsController>();
    final rentalDetails = detailsController.rentalDetails.value;

    return Obx(() {
      final bool isRevisionMode = controller.hasResetItem;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Offer Amount',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: isDark
                ? AppColors.primaryBorderColor
                : AppColors.secondaryTextColor,
          ),
          SizedBox(height: 4.h),
          CustomPrimaryText(
            text: '\${totalAmount.toStringAsFixed(2)}',
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.titleColor,
          ),
          CustomPrimaryText(
            text:
                'Based on condition and market value. This offer is valid for ${rentalDetails?.rentalTerm?.days ?? 14} days.',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: isDark
                ? AppColors.primaryBorderColor
                : AppColors.lightGreyColor,
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomPrimaryButton(
                  height: 40.h,
                  text: 'Accept',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AcceptDialog(),
                    );
                  },
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: CustomPrimaryButton(
                  height: 40.h,
                  text: 'Reject',
                  backgroundColor: AppColors.whiteColor,
                  border: Border.all(
                    width: 1.r,
                    color: AppColors.buttonBorderColor,
                  ),
                  textColor: AppColors.labelColor,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomRejectDialog(),
                    );
                  },
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomPrimaryButton(
            height: 40.h,
            text: isRevisionMode ? 'Cancel Revision' : 'Request Revision',
            backgroundColor: AppColors.whiteColor,
            border: Border.all(width: 1.r, color: AppColors.buttonBorderColor),
            textColor: AppColors.labelColor,
            onPressed: () {
              if (isRevisionMode) {
                controller.hasResetItem = false;
              } else {
                showDialog(
                  context: context,
                  builder: (context) => RevisionDialog(),
                );
              }
            },
            fontSize: 14.sp,
          ),
        ],
      );
    });
  }
}
