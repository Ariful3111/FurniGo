import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignPreferenceMoodColor
  extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreferenceMoodColor({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: "Color Mood",
          fontSize: 16.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.colorMoodList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 2,
          ),
          itemBuilder: (context, index) {
            final item = controller.colorMoodList[index];
            return Obx(
              () => GestureDetector(
                onTap: () => controller.selectedColorIndex.value = index,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomRadioButton(
                          value: index,
                          onChange: (value) {
                            controller.selectedColorIndex.value = value;
                          },
                          groupValue: controller.selectedColorIndex.value,
                        ),
                        CustomPrimaryText(
                          text: item['title'],
                          fontSize: 12.sp,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.darkColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 6.h),
                    Expanded(
                      child: SharedContainer(
                        radius: 8.r,
                        padding: EdgeInsets.zero,
                        color: item['color'],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
