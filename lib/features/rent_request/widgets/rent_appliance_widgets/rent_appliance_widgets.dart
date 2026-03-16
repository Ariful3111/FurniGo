import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_appliance_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_appliance_widgets/rent_appliance_header.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentApplianceWidgets extends GetWidget<RentApplianceController> {
  const RentApplianceWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RentApplianceHeader(),
          SizedBox(height: 16.h,),
          ...List.generate(controller.widgets.length, (index) {
            final item = controller.widgets[index];
            final isSelected = controller.isOpenList[index];
            return Column(
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
                              controller.isOpenList[index] =
                                  !controller.isOpenList[index];
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
                            ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              key: ValueKey('widgets'),
                              children: [item['child']],
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
        ],
      ),
    );
  }
}
