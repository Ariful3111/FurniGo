import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_appliance_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentApplianceHeader extends StatelessWidget {
  const RentApplianceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    RentApplianceController rentApplianceController = Get.find();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'Items & appliances',
          fontWeight: FontWeight.w600,
          color: AppColors.darkColor,
        ),
        SizedBox(height: 20.h,),
        optionContainer(
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
                    color: Color(0xFF6A7282),
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Obx(() {
                return CustomSwitchButton(
                  isOn: rentApplianceController.isAppliance.value,
                  onChanged: (value) {
                    rentApplianceController.isAppliance.value = value;
                  },
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
