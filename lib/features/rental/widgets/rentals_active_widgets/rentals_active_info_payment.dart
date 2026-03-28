import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rental_completed_widgets/rental_complete_download_button.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_active_widgets/rentals_active_installment.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsActiveInfoPayment extends GetWidget<RentalDetailsController> {
  const RentalsActiveInfoPayment({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final rentalDetails = controller.rentalDetails.value;

    final rentalTerms = rentalDetails?.rentalTerms;
    final paymentFrequency = rentalTerms?.paymentFrequency ?? 'monthly';
    final isInstallment = paymentFrequency.toLowerCase() == 'installments';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Payment plan',
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 16.h),
        isInstallment
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
        rentalDetails?.status?.capitalizeFirst == 'Active'
            ? isInstallment
                  ? updatePayment()
                  : Row(
                      children: [
                        Expanded(child: updatePayment()),
                        SizedBox(width: 12.w),
                        Expanded(child: RentalCompleteDownloadButton()),
                      ],
                    )
            : RentalCompleteDownloadButton(),
        SizedBox(height: 20.h),
        if (rentalDetails?.status?.capitalizeFirst == 'Active')
          CustomPrimaryButton(
            height: 40.h,
            text: isInstallment ? 'Pay Now' : 'Pay Early',
            onPressed: () {},
            fontSize: 14.sp,
          ),
      ],
    );
  }

  Widget text({required String text, required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      fontSize: 12.sp,
      color: isDark ? AppColors.primaryBorderColor : AppColors.greyTextColor,
      fontWeight: FontWeight.w400,
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
