import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/shop/controller/shop_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ShopSearchFilter extends GetWidget<ShopController> {
  const ShopSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      insetPadding: EdgeInsets.all(12.r),
      alignment: Alignment(1, 0),
      child: SharedContainer(
        height: MediaQuery.heightOf(context) * 0.7,
        width: 320.w,
        padding: EdgeInsets.symmetric(horizontal: 8.63.w, vertical: 16.h),
        radius: 8.63.r,
        color: isDark ? AppColors.darkSecondaryColor : AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 28,
            color: AppColors.shadowColor.withValues(alpha: 0.1),
          ),
        ],
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: List.generate(controller.sections.length, (index) {
                final item = controller.sections[index];
                final isExpanded = controller.expandedList[index];
                return Column(
                  children: [
                    InkWell(
                      onTap: () => controller.expandedList[index] =
                          !controller.expandedList[index],
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                if (item['icon'])
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.w),
                                    child: Image.asset(
                                      item['image'],
                                      height: 18.h,
                                      width: 18.w,
                                    ),
                                  ),

                                CustomPrimaryText(
                                  text: item['title'],
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isDark
                                      ? AppColors.whiteColor
                                      : AppColors.buttonTextColor,
                                ),
                              ],
                            ),
                          ),
                          AnimatedRotation(
                            turns: isExpanded ? 0.5 : 0,
                            duration: Duration(milliseconds: 300),
                            child: Image.asset(
                              isExpanded
                                  ? IconsPath.upArrow
                                  : IconsPath.downArrow,
                              height: 18.h,
                              width: 18.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AnimatedSize(
                      duration: Duration(milliseconds: 300),
                      child: isExpanded ? item['widget'] : SizedBox.shrink(),
                    ),
                    if (index != controller.sections.length - 1)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: CustomDivider(),
                      ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
