import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_business_identification_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_submit_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentBusinessNext extends StatelessWidget {
  const RentBusinessNext({super.key});

  @override
  Widget build(BuildContext context) {
    RentBusinessIdentificationController controller = Get.find();

    return Obx(() {
      final isLast =
          controller.currentIndex.value < controller.rentWidgets.length - 1;
      return controller.currentIndex.value == controller.rentWidgets.length - 1
          ? myButton(
              color: AppColors.acceptButtonColor,
              onTap: () { 
                showDialog(
                  context: context,
                  builder: (context) => RentSubmitDialog(),
                );
              },
              child: CustomPrimaryText(
                text: 'Submit Request',
                fontSize: 14.sp,
                color: AppColors.whiteColor,
              ),
            )
          : myButton(
              color: AppColors.primaryColor,
              onTap: () {
                if (isLast) {
                  controller.currentIndex.value++;
                }
              },
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
