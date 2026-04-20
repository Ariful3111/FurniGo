import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_product_placement_regenerate_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiProductPlacementRegenerateDropdownItem
    extends GetWidget<AiProductPlacementRegenerateController> {
  const AiProductPlacementRegenerateDropdownItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      width: 140.w,
      padding: EdgeInsets.all(12.w),
      radius: 12.r,
      color:  Colors.black.withValues(alpha: 0.5),
      child: Obx(() {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(controller.items.length, (index) {
            final item = controller.items[index];
            final isSelected = controller.selectedIndex.value == index;

            return GestureDetector(
              onTap: () {
                controller.selectedIndex.value = index;
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 8.h),
                padding: EdgeInsets.symmetric(vertical: 4.h),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.whiteColor.withValues(alpha: 0.2),
                      width: 0.5,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(8, 8),
                      blurRadius: 30,
                      color: AppColors.darkColor.withValues(alpha: 0.2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SharedContainer(
                      padding: EdgeInsets.zero,
                      width: 24.w,
                      height: 24.h,
                      radius: 4.r,
                      image: DecorationImage(
                        image: AssetImage(item['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    CustomPrimaryText(
                      text: item['title'],
                      fontSize: 12.sp,
                      color: isSelected
                          ? isDark
                                ? AppColors.boxColor
                                : AppColors.primaryColor
                          : AppColors.whiteColor,
                    ),

                    Spacer(),
                    if (isSelected)
                      Icon(
                        Icons.check,
                        size: 14.sp,
                        color: isDark
                            ? AppColors.boxColor
                            : AppColors.primaryColor,
                      ),
                  ],
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
