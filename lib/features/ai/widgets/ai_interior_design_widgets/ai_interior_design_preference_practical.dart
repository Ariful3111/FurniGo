import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignPreferencePractical
    extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreferencePractical({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        answer(
          title: "Rental-friendly design?",
          selectedValue: controller.rentalFriendly,
          isDark: isDark,
        ),
        SizedBox(height: 20.h),
        answer(
          title: "Kids / Pets?",
          selectedValue: controller.kidsPets,
          isDark: isDark,
        ),
      ],
    );
  }

  Widget answer({
    required String title,
    required RxString selectedValue,
    required bool isDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),

        Obx(() {
          return Row(
            children: ['Yes', 'No'].map((value) {
              final isSelected = selectedValue.value == value;
              return Expanded(
                child: GestureDetector(
                  onTap: () => selectedValue.value = value,
                  child: SharedContainer(
                    margin: EdgeInsets.only(right: value == 'Yes' ? 8.w : 0),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    radius: 8.r,
                    border: Border.all(
                      width: 1,
                      color: isSelected
                          ? isDark
                                ? AppColors.boxColor
                                : AppColors.primaryColor
                          : (isDark
                                ? AppColors.greyTextColor
                                : AppColors.darkPrimaryTextColor),
                    ),
                    child: Center(
                      child: CustomPrimaryText(
                        text: value,
                        fontSize: 12.sp,
                        color: isSelected
                            ? isDark
                                  ? AppColors.boxColor
                                  : AppColors.primaryColor
                            : (isDark
                                  ? AppColors.greyTextColor
                                  : AppColors.darkPrimaryTextColor),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}
