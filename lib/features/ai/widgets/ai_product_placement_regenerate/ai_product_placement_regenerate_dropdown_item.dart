import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_regenerate_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AiProductPlacementRegenerateDropdownItem
    extends GetWidget<AiProductPlacementRegenerateController> {
  const AiProductPlacementRegenerateDropdownItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkColor : Color(0xFF8E8E8E),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(controller.items.length, (index) {
          final item = controller.items[index];
          final bool isLast = index == controller.items.length - 1;
          final bool isSelected = controller.selectedIndex.value == index;
          return InkWell(
            onTap: () {
              controller.selectedIndex.value = index;
              Navigator.pop(context);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: Image.asset(
                          item['image'],
                          width: 24.w,
                          height: 24.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: CustomPrimaryText(
                          text: item['title'],
                          fontSize: 12.sp,
                          color: isSelected
                              ? isDark
                                    ? AppColors.successColor
                                    : AppColors.primaryColor
                              : AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: isSelected
                        ? isDark
                              ? AppColors.successColor.withValues(
                                  alpha: 0.25,
                                )
                              : AppColors.primaryColor.withValues(alpha: 0.25)
                        : AppColors.whiteColor.withValues(alpha: 0.25),
                    indent: 16.w,
                    endIndent: 16.w,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
