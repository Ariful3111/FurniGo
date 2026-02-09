import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_appliance_controller.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentApplianceWidgets extends StatelessWidget {
  const RentApplianceWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    RentApplianceController rentApplianceController = Get.find();
    return Obx(
      () => Column(
        children: List.generate(rentApplianceController.widgets.length, (
          index,
        ) {
          final item = rentApplianceController.widgets[index];
          final isSelected = rentApplianceController.isOpenList[index];
          return Column(
            key: ValueKey(index),
            children: [
              SharedContainer(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
                radius: 16.r,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomPrimaryText(
                          text: item['title'],
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkColor,
                        ),
                        InkWell(
                          onTap: () {
                            rentApplianceController.isOpenList[index] =
                                !rentApplianceController.isOpenList[index];
                          },
                          child: AnimatedRotation(
                            turns: isSelected ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Image.asset(
                              isSelected
                                  ? IconsPath.upArrow
                                  : IconsPath.downArrow,
                              height: 20.h,
                              width: 20.w,
                              color: AppColors.darkColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AnimatedSize(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                      child: isSelected
                          ? Padding(
                              padding: EdgeInsetsGeometry.only(top: 20.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                key: ValueKey('widgets'),
                                children: [
                                  optionContainer(
                                    context: context,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CustomPrimaryText(
                                              text: 'Appliances required?',
                                              fontSize: 14.sp,
                                              color: AppColors.darkTextColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            SizedBox(height: 4.h),
                                            CustomPrimaryText(
                                              text:
                                                  'Include appliance in your quote',
                                              fontSize: 14.sp,
                                              color: Color(0xFF6A7282),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                        Obx(() {
                                          return CustomSwitchButton(
                                            isOn: rentApplianceController
                                                .isAppliance
                                                .value,
                                            onChanged: (value) {
                                              rentApplianceController
                                                      .isAppliance
                                                      .value =
                                                  value;
                                            },
                                          );
                                        }),
                                      ],
                                    ),
                                  ),

                                  item['child'],
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        }),
      ),
    );
  }
}
