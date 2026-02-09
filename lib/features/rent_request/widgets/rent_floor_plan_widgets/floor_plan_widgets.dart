import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_floor_plan_controller.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class FloorPlanWidgets extends StatelessWidget {
  const FloorPlanWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    RentFloorPlanController rentFloorPlanController = Get.find();
    return Obx(
      () => Column(
        children: List.generate(rentFloorPlanController.widgets.length, (
          index,
        ) {
          final item = rentFloorPlanController.widgets[index];
          final isSelected = rentFloorPlanController.isOpenList[index];
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
                            rentFloorPlanController.isOpenList[index] =
                                !rentFloorPlanController.isOpenList[index];
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
                                key: ValueKey('widgets'),
                                children: [
                                  propertyDivider(),
                                  SizedBox(height: 16.h),
                                  item['child'],
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
