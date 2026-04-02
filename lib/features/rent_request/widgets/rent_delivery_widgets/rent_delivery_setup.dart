import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_delivery_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_delivery_widgets/rent_delivery_access.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_error_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentDeliverySetup extends GetWidget<RentDeliveryController> {
  const RentDeliverySetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedSize(
        duration: Duration(milliseconds: 300),
        child: controller.isSetup.value
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 26.h),
                  RentErrorContainer(
                    text: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomPrimaryText(
                          text: 'Setup makes things easier!',
                          fontSize: 14.sp,
                          color: AppColors.errorTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                        CustomPrimaryText(
                          text: 'Additional setup charges may apply.',
                          fontSize: 14.sp,
                          color: AppColors.errorTextColor2,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.h),
                  CustomPrimaryText(
                    text: 'Access Detail',
                    fontSize: 16.sp,
                    color: AppColors.titleTextColor,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 16.h),
                  RentDeliveryAccess(),
                ],
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
