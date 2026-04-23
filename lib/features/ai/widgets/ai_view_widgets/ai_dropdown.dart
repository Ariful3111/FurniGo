import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/ai/controller/ai_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_user_image.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiDropdown extends GetWidget<AiController> {
  const AiDropdown({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CompositedTransformTarget(
      link: controller.layerLink,
      child: GestureDetector(
        onTap: () => controller.toggleDropdown(context),
        child: SharedContainer(
          padding: EdgeInsets.all(4.r),
          color: isDark ? AppColors.boxColor : AppColors.primaryColor,
          radius: 33.33.r,
          border: Border.all(color: AppColors.whiteColor, width: 0.83),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AiUserImage(),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPrimaryText(
                    text: 'John Smith',
                    fontSize: 12.sp,
                    color: isDark ? AppColors.darkColor : AppColors.whiteColor,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        IconsPath.creditCoin,
                        height: 12.h,
                        width: 12.w,
                        color: isDark
                            ? AppColors.darkColor
                            : AppColors.whiteColor,
                      ),
                      SizedBox(width: 4.w),
                      CustomPrimaryText(
                        text: '1250 Credit',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark
                            ? AppColors.darkColor
                            : AppColors.whiteColor,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 20.w),
              Icon(
                Icons.keyboard_arrow_down,
                color: isDark ? AppColors.darkColor : AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
