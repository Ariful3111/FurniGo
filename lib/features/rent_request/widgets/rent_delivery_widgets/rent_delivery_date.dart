import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/utils/date_picker.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_delivery_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_date_fields.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentDeliveryDate extends GetWidget<RentDeliveryController> {
  const RentDeliveryDate({super.key});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Availability1',
          fontSize: 14.sp,
          color: isDark? AppColors.whiteColor: AppColors.titleTextColor,
        ),
        SizedBox(height: 8.h),
        CustomDateField(
          controller: controller.deliveryDateController,
          onTap: () {
            DatePicker.pickDate(
              context: context,
              onDateSelected: (date) {
                final String formattedDate =
                    '${date.day}/${date.month}/${date.year}';
                controller.deliveryDateController.text = formattedDate;
              },
            );
          },
        ),
        SizedBox(height: 12.h),
        CustomPrimaryText(
          text: 'Preferred Time Period *',
          fontSize: 14.sp,
          color: isDark? AppColors.whiteColor: AppColors.titleTextColor,
        ),
      ],
    );
  }
}
