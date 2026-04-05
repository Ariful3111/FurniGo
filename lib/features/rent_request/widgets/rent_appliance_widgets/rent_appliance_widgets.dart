import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_appliance_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_appliance_widgets/rent_appliance_header.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_appliance_widgets/rent_appliance_widgets_details.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentApplianceWidgets extends GetWidget<RentApplianceController> {
  const RentApplianceWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RentApplianceHeader(),
          SizedBox(height: 16.h),
          ...List.generate(controller.item.length, (index) {
            final item = controller.item[index];
            final isSelected = controller.isOpenList[index];
            return AnimatedSize(
              duration: Duration(milliseconds: 300),
              child: controller.isAppliance.value
                  ? Column(
                      key: ValueKey(index),
                      children: [
                        SharedContainer(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.h,
                            horizontal: 24.w,
                          ),
                          radius: 16.r,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomPrimaryText(
                                    text: item.appliances,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isDark
                                        ? AppColors.whiteColor
                                        : AppColors.darkColor,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.isOpenList[index] =
                                          !controller.isOpenList[index];
                                    },
                                    child: AnimatedRotation(
                                      turns: isSelected ? 1 : 0,
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      child: Image.asset(
                                        isSelected
                                            ? IconsPath.upArrow
                                            : IconsPath.downArrow,
                                        height: 20.h,
                                        width: 20.w,
                                        color: isDark
                                            ? AppColors.whiteColor
                                            : AppColors.darkColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              AnimatedSize(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.linear,
                                child: isSelected
                                    ? RentApplianceWidgetsDetails(
                                        key: ValueKey('widgets'),
                                        model: item,
                                      )
                                    : SizedBox.shrink(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    )
                  : SizedBox(),
            );
          }),
        ],
      ),
    );
  }
}
