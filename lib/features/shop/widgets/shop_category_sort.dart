import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/shop/controller/shop_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ShopCategorySort extends GetWidget<ShopController> {
  const ShopCategorySort({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 36.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        separatorBuilder: (_, _) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return Obx(() {
            final isSelected = controller.selectedIndex.value == index;
            return GestureDetector(
              onTap: () => controller.selectedIndex.value = index,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 16.w : 12.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryColor
                      : (isDark
                            ? AppColors.darkSecondaryColor
                            : AppColors.fieldColor),
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: isSelected
                          ? AppColors.whiteColor
                          : (isDark
                                ? AppColors.whiteColor
                                : AppColors.labelColor),
                    ),
                    child: CustomPrimaryText(
                      text: controller.categories[index],
                      fontSize: 12.sp,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w400,
                      color: isSelected
                          ? AppColors.whiteColor
                          : (isDark
                                ? AppColors.whiteColor
                                : AppColors.labelColor),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
