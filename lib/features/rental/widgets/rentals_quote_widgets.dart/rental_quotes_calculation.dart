import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_calculation_amount.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalQuotesCalculation extends GetWidget<RentalDetailsController> {
  const RentalQuotesCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final detailsController = Get.find<RentalDetailsController>();
    final rentalDetails = detailsController.rentalDetails.value;

    if (rentalDetails == null) {
      return const SizedBox.shrink();
    }

    final double subtotal = _calculateSubtotal(rentalDetails);
    final double discount = _calculateDiscount(rentalDetails, subtotal);
    final double setupCharge = _calculateSetupCharge(rentalDetails);
    final double total = subtotal - discount + setupCharge;

    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1.r, color: AppColors.buttonBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Calculation',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.darkColor,
          ),
          SizedBox(height: 24.h),
          cal(
            title: 'Subtotal',
            amount: '\${subtotal.toStringAsFixed(2)}',
            context: context,
          ),
          SizedBox(height: 12.h),
          cal(
            title:
                'Discount (${rentalDetails.rentalTerm?.discountPercent ?? 3}%)',
            amount: '-\${discount.toStringAsFixed(2)}',
            context: context,
          ),
          SizedBox(height: 12.h),
          cal(
            title: 'Setup Charge',
            amount: '\${setupCharge.toStringAsFixed(2)}',
            context: context,
          ),
          SizedBox(height: 16.h),
          CustomDivider(color: AppColors.buttonBorderColor),
          SizedBox(height: 6.h),
          cal(
            title: 'Total',
            amount: '\${total.toStringAsFixed(2)}',
            context: context,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 20.h),
          RentalQuotesCalculationAmount(totalAmount: total),
        ],
      ),
    );
  }

  double _calculateSubtotal(dynamic rentalDetails) {
    double subtotal = 0.0;
    final furnitureSelection = rentalDetails.furnitureSelection ?? [];
    for (final selection in furnitureSelection) {
      final items = selection.items ?? [];
      for (final item in items) {
        subtotal += (item.price ?? 0.0) * (item.count ?? 1);
      }
    }
    final applianceSelection = rentalDetails.applianceSelection ?? [];
    for (final selection in applianceSelection) {
      final items = selection.items ?? [];
      for (final item in items) {
        subtotal += (item.price ?? 0.0) * (item.count ?? 1);
      }
    }
    return subtotal;
  }

  double _calculateDiscount(dynamic rentalDetails, double subtotal) {
    final discountPercent = rentalDetails.rentalTerm?.discountPercent ?? 3;
    return subtotal * (discountPercent / 100);
  }

  double _calculateSetupCharge(dynamic rentalDetails) {
    return 50.0; // Fixed setup charge
  }

  Widget cal({
    required String title,
    required String amount,
    required BuildContext context,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: fontSize ?? 14.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: isDark
              ? AppColors.darkPrimaryTextColor
              : AppColors.darkTextColor,
        ),
        CustomPrimaryText(
          text: amount,
          fontSize: fontSize ?? 14.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: isDark
              ? AppColors.darkPrimaryTextColor
              : AppColors.darkTextColor,
        ),
      ],
    );
  }
}
