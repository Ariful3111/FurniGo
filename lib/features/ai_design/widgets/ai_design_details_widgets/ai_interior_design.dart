import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai_design/controller/ai_design_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class AiInteriorDesign extends StatelessWidget {
  const AiInteriorDesign({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AiDesignDetailsController aiDesignDetailsController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: 'AI Interior Design 01',
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.whiteColor : AppColors.darkColor,
        ),
        SizedBox(height: 12.h),
        CustomPrimaryText(
          text: 'Keep important places saved for easy access',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: isDark
              ? AppColors.primaryBorderColor
              : AppColors.greyTextColor,
        ),
        SizedBox(height: 20.h),
        ...List.generate(aiDesignDetailsController.roomDetails.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom:aiDesignDetailsController.roomDetails.length-1==index?0: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(text: aiDesignDetailsController.roomTitle[index], isDark: isDark),
                SizedBox(height: 12.h,),
                DetailsRowModel(data: aiDesignDetailsController.roomDetails[index]),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget text({
    required String text,
    required bool isDark,
    FontWeight? fontWeight,
  }) {
    return CustomPrimaryText(
      text: text,
      fontWeight: fontWeight ?? FontWeight.w600,
      fontSize: 16.sp,
      color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
    );
  }
}
