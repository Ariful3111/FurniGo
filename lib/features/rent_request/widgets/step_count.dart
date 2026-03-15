import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_business_identification_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class StepCount extends StatelessWidget {
  const StepCount({super.key});

  @override
  Widget build(BuildContext context) {
    RentBusinessIdentificationController controller = Get.find();
    return CustomPrimaryText(
      text:
          'Step ${controller.currentIndex.value} of ${controller.rentWidgets.length - 1}',
      color: AppColors.greyColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
