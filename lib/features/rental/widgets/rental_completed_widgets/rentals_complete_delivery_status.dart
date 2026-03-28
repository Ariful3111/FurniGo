import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsCompleteDeliveryStatus extends GetWidget<RentalDetailsController> {
  const RentalsCompleteDeliveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final rentalDetails = controller.rentalDetails.value;

    if (rentalDetails == null) {
      return const SizedBox.shrink();
    }

    final deliverySetup = rentalDetails.deliverySetup;
    final preferredDate = deliverySetup?.preferredDeliveryDate ?? '12/8/26';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row(title: 'Preferred Date', sub: preferredDate, isDark: isDark),
        SizedBox(height: 20.h),
        row(
          title: 'Contact Person',
          sub: deliverySetup?.contactPerson ?? 'John Doe',
          isDark: isDark,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  Widget row({
    required String title,
    required String sub,
    required bool isDark,
    FontWeight? fontWeight,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        CustomPrimaryText(
          text: sub,
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          fontWeight: fontWeight,
        ),
      ],
    );
  }
}
