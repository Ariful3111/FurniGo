import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/accept_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_reject_dialog.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/revision_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalQuotesCalculationAmount extends GetWidget<RentalQuotesController> {
  const RentalQuotesCalculationAmount({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
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
            text: '\$12545.00',
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.titleColor,
          ),
          CustomPrimaryText(
            text:
                'Based on condition and market value. This offer is valid for 14 days.',
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
                  text: isRevisionMode ? 'Request Revision' : 'Accept',
                  onPressed: isRevisionMode
                      ? () {
                          showDialog(
                            barrierColor: isDark
                                ? AppColors.whiteColor.withValues(alpha: 0.3)
                                : null,
                            context: context,
                            builder: (context) {
                              return RevisionDialog();
                            },
                          );
                        }
                      : () {
                          showDialog(
                            barrierColor: isDark
                                ? AppColors.whiteColor.withValues(alpha: 0.3)
                                : null,
                            context: context,
                            builder: (context) {
                              return AcceptDialog();
                            },
                          );
                        },
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: CustomPrimaryButton(
                  height: 40.h,
                  text: 'Decline',
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierColor: isDark
                          ? AppColors.whiteColor.withValues(alpha: 0.3)
                          : null,
                      builder: (context) {
                        return CustomRejectDialog();
                      },
                    );
                  },
                  fontSize: 12.sp,
                  backgroundColor: AppColors.whiteColor,
                  border: Border.all(
                    width: 1.r,
                    color: AppColors.buttonBorderColor,
                  ),
                  textColor: const Color(0xFFE7000B),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
