import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rental_completed_widgets/rental_complete_delivery_date_time.dart';
import 'package:zb_dezign/features/rental/widgets/rental_completed_widgets/rentals_complete_delivery_status.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentalsCompleteDelivery extends GetWidget<RentalDetailsController> {
  const RentalsCompleteDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        SharedContainer(
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: 'Return Rental Product',
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: isDark ? AppColors.whiteColor : AppColors.darkColor,
              ),
              SizedBox(height: 9.h),
              CustomTableStatus(
                status:
                    controller.rentalDetails.value?.status?.capitalizeFirst ==
                        "Pending"
                    ? 'Pending'
                    : 'Completed',
              ),
              SizedBox(height: 12.h),
              CustomDivider(),
              SizedBox(height: 12.h),
              controller.rentalDetails.value?.status?.capitalizeFirst ==
                      "Complete"
                  ? RentalCompleteDeliveryDateTime()
                  : RentalsCompleteDeliveryStatus(),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        CustomPrimaryButton(
          text: 'Submit',
          onPressed: () {},
          height: 40.h,
          fontSize: 12.sp,
          border: Border.all(
            width: 1.r,
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.buttonBorderColor,
          ),
        ),
      ],
    );
  }
}
