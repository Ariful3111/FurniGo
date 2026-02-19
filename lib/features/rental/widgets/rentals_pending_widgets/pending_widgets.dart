import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controller/rental_pending_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class PendingWidgets extends StatelessWidget {
  const PendingWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    RentalPendingController rentalPendingController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Column(
        children: List.generate(rentalPendingController.pendingWidgets.length, (
          index,
        ) {
          final item = rentalPendingController.pendingWidgets[index];
          final isSelected = rentalPendingController.isOpenList[index];
          return Column(
            key: ValueKey(index),
            children: [
              SharedContainer(
                padding: EdgeInsets.all(20.r),
                radius: 16.r,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomPrimaryText(
                              text: item['title'],
                              fontWeight: FontWeight.w600,
                              color: isDark
                                  ? AppColors.whiteColor
                                  : AppColors.darkColor,
                            ),
                            if (item['title'] == 'Appliances' ||
                                item['title'] == 'Furniture')
                              SizedBox(height: 12.h),
                            if (item['title'] == 'Appliances' ||
                                item['title'] == 'Furniture')
                              CustomPrimaryText(
                                text: item['subTitle'],
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyTextColor,
                              ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            rentalPendingController.isOpenList[index] =
                                !rentalPendingController.isOpenList[index];
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
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                      alignment: Alignment.topCenter,
                      child: isSelected
                          ? Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Column(
                                key: const ValueKey('widgets'),
                                children: [item['widgets']],
                              ),
                            )
                          : const SizedBox.shrink(),
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
