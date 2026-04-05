import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_floor_plan_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_floor_plan_widgets/office_floor.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class FloorPlanWidgets extends GetWidget<RentFloorPlanController> {
  const FloorPlanWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Column(
        children: List.generate(controller.items.length, (index) {
          final item = controller.items[index];
          final isSelected = controller.isOpenList[index];
          return Column(
            key: ValueKey(item.title),
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
                          text: item.title,
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
                            duration: const Duration(milliseconds: 300),
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
                      child: isSelected
                          ? Padding(
                              padding: EdgeInsetsGeometry.only(top: 20.h),
                              child: Column(
                                key: ValueKey('${item.title}_details'),
                                children: [
                                  CustomDivider(),
                                  SizedBox(height: 16.h),
                                  OfficeFloor(item: item),
                                ],
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
            ],
          );
        }),
      ),
    );
  }
}
