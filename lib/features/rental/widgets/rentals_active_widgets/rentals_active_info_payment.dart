import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controller/rental_active_controller.dart';
import 'package:zb_dezign/features/rental/model/rental_model.dart';
import 'package:zb_dezign/features/rental/widgets/rental_completed_widgets/rental_complete_download_button.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_active_widgets/rentals_active_installment.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsActiveInfoPayment extends StatelessWidget {
  const RentalsActiveInfoPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final RentalModel rentalModel = Get.arguments as RentalModel;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    RentalActiveController activeController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Payment plan',
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 16.h),
        activeController.isInstallment
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(text: 'Plan Type', isDark: isDark),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text: 'Full payment',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.darkTextColor,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      text(text: 'Paid to date', isDark: isDark),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text: '\$145.00',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: isDark
                            ? AppColors.whiteColor
                            : Color(0xFF00A63E),
                      ),
                    ],
                  ),
                ],
              )
            : RentalsActiveInstallment(),
        SizedBox(height: 16.h),
        rentalModel.status == 'Active'
            ? activeController.isInstallment
                  ? updatePayment()
                  : Row(
                      children: [
                        Expanded(child: updatePayment()),
                        SizedBox(width: 12.w,),
                        Expanded(child: RentalCompleteDownloadButton()),
                      ],
                    )
            : RentalCompleteDownloadButton(),
        SizedBox(height: 20.h),
        if (rentalModel.status == 'Active')
          CustomPrimaryButton(
            height: 40.h,
            text: activeController.isInstallment ? 'Pay Now' : 'Pay Early',
            onPressed: () {},
            fontSize: 14.sp,
          ),
      ],
    );
  }

  Widget updatePayment() {
    return CustomPrimaryButton(
      height: 40.h,
      fontSize: 12.sp,
      backgroundColor: AppColors.whiteColor,
      border: Border.all(width: 1.r, color: AppColors.buttonBorderColor),
      text: 'Update Payment Method',
      textColor: AppColors.labelColor,
      onPressed: () {},
    );
  }
}
