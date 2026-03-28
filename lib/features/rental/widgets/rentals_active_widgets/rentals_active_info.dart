import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_active_widgets/rentals_active_info_details.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentalsActiveInfo extends GetWidget<RentalDetailsController> {
  const RentalsActiveInfo({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final rentalDetails = controller.rentalDetails.value;

    return Column(
      children: [
        SharedContainer(
          radius: 12.r,
          padding: EdgeInsets.all(20.r),
          border: Border.all(width: 1.r, color: AppColors.borderColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: rentalDetails?.uuid ?? 'N/A',
                color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 12.w),
              CustomTableStatus(status: rentalDetails?.status ?? 'Pending'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPrimaryText(
                        text: 'Started ${rentalDetails?.startDate ?? 'N/A'}',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColors.primaryBorderColor
                            : AppColors.greyTextColor,
                      ),
                      SizedBox(height: 8.h),
                      CustomPrimaryText(
                        text:
                            'Lease End Date: ${rentalDetails?.endDate ?? 'N/A'}',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColors.primaryBorderColor
                            : AppColors.greyTextColor,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomPrimaryText(
                        text: 'Next Payment',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.labelColor,
                      ),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text: '\$125.00',
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.labelColor,
                      ),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text: rentalDetails?.status?.capitalizeFirst == 'Active'
                            ? 'Due Nov 15, 2023'
                            : 'Paid',
                        fontSize: 12.sp,
                        fontWeight:
                            rentalDetails?.status?.capitalizeFirst == 'Active'
                            ? FontWeight.w400
                            : FontWeight.w700,
                        color:
                            rentalDetails?.status?.capitalizeFirst == 'Active'
                            ? (isDark
                                  ? AppColors.whiteColor
                                  : AppColors.labelColor)
                            : const Color(0xFF00A63E),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        const RentalsActiveInfoDetails(),
      ],
    );
  }
}
