import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_period_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/other_field.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_error_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentPeriodTypeBudget extends StatelessWidget {
  const RentPeriodTypeBudget({super.key});

  @override
  Widget build(BuildContext context) {
    RentPeriodController rentPeriodController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Budget Preference',
          fontSize: 14.sp,
          color: AppColors.titleTextColor,
        ),
        SizedBox(height: 12.h),
        OtherField(
          controller: rentPeriodController.otherController,
          width: 179.w,
          labelText: 'Enter Budget',
          keyboardType: TextInputType.numberWithOptions(),
        ),
        SizedBox(height: 12.h),
        RentErrorContainer(
          text: CustomPrimaryText(
            text: 'This helps us optimize pricing!',
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.errorTextColor,
          ),
        ),
      ],
    );
  }
}
