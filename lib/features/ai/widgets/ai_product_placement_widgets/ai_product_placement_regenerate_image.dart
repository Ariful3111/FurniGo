import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_regenerate_dropdown.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiProductPlacementRegenerateImage extends StatelessWidget {
  const AiProductPlacementRegenerateImage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.all(16.w),
      color: isDark ? AppColors.labelColor : AppColors.boxColor,
      border: Border.all(
        color: isDark ? AppColors.darkBorderColor : AppColors.whiteBorderColor,
      ),
      radius: 20.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text:
                'Add your requirements Tell us how you\'d like the placement to look or if there are specific adjustments you’d like the AI to make.',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: isDark ? AppColors.whiteColor : AppColors.darkColor,
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () {},
            child: SharedContainer(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              radius: 16.r,
              color: isDark ? AppColors.whiteColor : AppColors.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomPrimaryText(
                    text: 'Change Product',
                    fontSize: 12.sp,
                    color: isDark ? AppColors.darkColor : AppColors.whiteColor,
                  ),
                  SizedBox(width: 8.w),
                  Image.asset(
                    IconsPath.arrowRight,
                    height: 16.h,
                    width: 16.w,
                    color: isDark ? AppColors.darkColor : AppColors.whiteColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          SharedContainer(
            padding: EdgeInsets.all(12.w),
            height: 140.h,
            radius: 20.r,
            width: MediaQuery.widthOf(context),
            color: isDark ? AppColors.darkColor : AppColors.whiteColor,
            border: Border.all(
              color: isDark ? AppColors.darkBorderColor : AppColors.fieldColor,
            ),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                CustomPrimaryText(
                  text: "Change the color of the sofa ",
                  fontSize: 12.sp,
                  color: isDark
                      ? AppColors.darkPrimaryTextColor
                      : AppColors.greyColor,
                ),
                AiProductPlacementRegenerateDropdown(),
                CustomPrimaryText(
                  text: " into red color.",
                  fontSize: 12.sp,
                  color: isDark
                      ? AppColors.darkPrimaryTextColor
                      : AppColors.greyColor,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          CustomPrimaryButton(
            height: 48.h,
            backgroundColor: AppColors.whiteColor,
            border: Border.all(color: AppColors.fieldColor),
            text: 'Cancel',
            textColor: AppColors.darkColor,
            fontSize: 20.sp,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
