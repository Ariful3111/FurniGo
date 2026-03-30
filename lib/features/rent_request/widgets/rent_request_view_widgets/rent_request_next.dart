import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_submit_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentRequestNext extends StatelessWidget {
  const RentRequestNext({super.key});

  @override
  Widget build(BuildContext context) {
    final stepController = Get.find<RentStepController>();

    return Obx(() {
      final isLastStep =
          stepController.currentIndex.value == stepController.totalSteps - 1;

      return isLastStep
          ? RentHelper.myButton(
              color: AppColors.acceptButtonColor,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const RentSubmitDialog(),
                );
              },
              child: CustomPrimaryText(
                text: 'Submit Request',
                fontSize: 14.sp,
                color: AppColors.whiteColor,
              ),
            )
          : RentHelper.myButton(
              color: AppColors.primaryColor,
              onTap: () => stepController.handleNextStep(),
              child: Row(
                children: [
                  CustomPrimaryText(
                    text: 'Next',
                    fontSize: 14.sp,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(width: 6.w),
                  Icon(
                    Icons.arrow_forward,
                    size: 12.r,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            );
    });
  }
}
