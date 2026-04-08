import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/favorites/controller/favorites_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class FavoritesHeader extends GetWidget<FavoritesController> {
  const FavoritesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          controller: controller.searchController,
          labelText: "Search Product...",
          labelColor: isDark
              ? AppColors.primaryBorderColor
              : AppColors.labelColor,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Image.asset(
              IconsPath.search,
              width: 20.w,
              height: 20.h,
              color: isDark
                  ? AppColors.primaryBorderColor
                  : AppColors.labelColor,
            ),
          ),
          borderRadius: 15.r,
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            CustomPrimaryText(
              text: "Sort by:",
              fontSize: 16.sp,
              color: isDark
                  ? AppColors.whiteColor
                  : AppColors.darkColor.withValues(alpha: 0.6),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: CustomDropdownMenu(
                borderColor: AppColors.grayBorderColor,
                onSelect: (String? value) {
                  controller.selectedSort.value = value!;
                },
                option: controller.sortList,
                isSelect: controller.selectedSort,
                label: '',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
