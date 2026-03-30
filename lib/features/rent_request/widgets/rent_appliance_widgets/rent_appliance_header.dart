import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_appliance_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentApplianceHeader extends GetWidget<RentApplianceController> {
  const RentApplianceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Items & appliances',
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor,
          ),
          SizedBox(height: 20.h),
          RentHelper.optionContainer(
            context: context,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPrimaryText(
                      text: 'Appliances required?',
                      fontSize: 14.sp,
                      color: AppColors.darkTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 4.h),
                    CustomPrimaryText(
                      text: 'Include appliance in your quote',
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                Obx(() {
                  return CustomSwitchButton(
                    isOn: controller.isAppliance.value,
                    onChanged: (value) {
                      controller.isAppliance.value = value;
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
