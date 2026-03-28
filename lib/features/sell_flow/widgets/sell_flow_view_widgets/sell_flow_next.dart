import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class SellFlowNext extends GetWidget<SellFlowController> {
  const SellFlowNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLast =
          controller.currentIndex.value >= controller.sellWidgets.length - 1;
      return RentHelper().myButton(
        color: AppColors.primaryColor,
        onTap: () {
          if (!isLast) {
            controller.sellFlowController.animateTo(
              duration: Duration(milliseconds: 300),
              curve: Curves.linear,
              controller.sellFlowController.position.minScrollExtent,
            );
            controller.currentIndex.value++;
          } else {
            debugPrint('Submit form');
          }
        },
        child: Row(
          children: [
            CustomPrimaryText(
              text: isLast ? 'Submit' : 'Next',
              fontSize: 14.sp,
              color: AppColors.whiteColor,
            ),
            SizedBox(width: 6.w),
            Icon(
              isLast ? Icons.check : Icons.arrow_forward,
              size: 12.r,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      );
    });
  }
}
