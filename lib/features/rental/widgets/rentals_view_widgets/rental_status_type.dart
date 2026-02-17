import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controller/rental_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentalStatusType extends StatelessWidget {
  const RentalStatusType({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    RentalController rentalController = Get.find();
    return SharedContainer(
      padding: EdgeInsets.all(8.r),
      radius: 12.r,
      child: SizedBox(
        height: 36.h,
        child: ListView.builder(
          itemCount: rentalController.statusList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Obx(() {
              final isSelected = rentalController.statusIndex.value == index;
              return GestureDetector(
                onTap: () {
                  rentalController.statusIndex.value = index;
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    color: isSelected ?isDark? AppColors.whiteColor:AppColors.secondaryColor : null,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: CustomPrimaryText(
                      text: rentalController.statusList[index],
                      color: isSelected ?isDark? AppColors.darkColor:Color(0xFFE2E2E2) :isDark? AppColors.whiteColor:AppColors.darkColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
