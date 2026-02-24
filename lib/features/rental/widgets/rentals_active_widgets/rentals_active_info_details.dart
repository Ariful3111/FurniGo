import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controller/rental_active_controller.dart';
import 'package:zb_dezign/features/rental/model/rental_model.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_active_widgets/rentals_active_info_payment.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentalsActiveInfoDetails extends StatelessWidget {
  const RentalsActiveInfoDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final RentalModel rentalModel = Get.arguments as RentalModel;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    RentalActiveController activeController = Get.find();
    return SharedContainer(
      radius: 12.r,
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Summary',
            fontSize: 16.sp,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(text: 'Term', isDark: isDark),
                  SizedBox(height: 4.h),
                  CustomPrimaryText(
                    text: '180 days',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  text(text: 'Discount applied', isDark: isDark),
                  SizedBox(height: 4.h),
                  CustomPrimaryText(
                    text: '16%',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.whiteColor : Color(0xFF00A63E),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(text: 'Total', isDark: isDark),
                  SizedBox(height: 4.h),
                  CustomPrimaryText(
                    text: '\$155.00',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  text(text: 'Status', isDark: isDark),
                  SizedBox(height: 4.h),
                  CustomTableStatus(
                    status: activeController.isInstallment
                        ? rentalModel.status
                        : '2nd installment: Due',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          CustomDivider(),
          SizedBox(height: 20.h),
          RentalsActiveInfoPayment(),
        ],
      ),
    );
  }
}
