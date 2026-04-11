import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_regenerate_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_product_placement_widgets/ai_product_placement_regenerate_dropdown_item.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AiProductPlacementRegenerateDropdown
    extends GetWidget<AiProductPlacementRegenerateController> {
  const AiProductPlacementRegenerateDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return PopupMenuButton(
        offset: Offset(0, 40.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            enabled: false,
            padding: EdgeInsets.zero,
            child: AiProductPlacementRegenerateDropdownItem(),
          ),
        ],
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: isDark
                ? AppColors.whiteColor.withValues(alpha: 0.2)
                : AppColors.darkColor.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomPrimaryText(
                text: controller.selectedLabel,
                fontSize: 12.sp,
                color: AppColors.whiteColor,
              ),
              SizedBox(width: 4.w),
              Icon(
                Icons.keyboard_arrow_down,
                size: 14.sp,
                color: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      );
    });
  }
}
