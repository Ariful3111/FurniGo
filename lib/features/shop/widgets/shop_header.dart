import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/shop/controller/shop_controller.dart';
import 'package:zb_dezign/features/shop/widgets/shop_search_filter.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ShopHeader extends GetWidget<ShopController> {
  const ShopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: controller.searchController,
                labelText: "Search Product...",
                labelColor:isDark? AppColors.primaryBorderColor:AppColors.labelColor,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Image.asset(
                    IconsPath.search,
                    width: 20.w,
                    height: 20.h,
                    color: isDark? AppColors.primaryBorderColor:AppColors.labelColor,
                  ),
                ),
                borderRadius: 15.r,
              ),
            ),
            SizedBox(width: 12.w),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ShopSearchFilter();
                  },
                );
              },
              child: SharedContainer(
                height: 44.h,
                width: 44.w,
                radius: 12.r,
                color: AppColors.fieldBorderColorLight,
                padding: EdgeInsets.all(10.w),
                child: Image.asset(
                  IconsPath.filter,
                  color: AppColors.labelColor,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
            ),
          ],
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
