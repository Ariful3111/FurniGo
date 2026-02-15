import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_delivery_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_error_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentDeliveryDetails extends StatelessWidget {
  const RentDeliveryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    RentDeliveryController rentDeliveryController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        optionContainer(
            context: context,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPrimaryText(
                        text: 'Setup required?',
                        fontSize: 14.sp,
                        color: AppColors.darkTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text:
                            'Professional setup service',
                        fontSize: 14.sp,
                        color: Color(0xFF6A7282),
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  return CustomSwitchButton(
                    isOn: rentDeliveryController.isSetup.value,
                    onChanged: (value) {
                      rentDeliveryController.isSetup.value = value;
                    },
                  );
                }),
              ],
            ),
          ),
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
      ],
    );
  }
}