import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell/controller/sell_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_filter.dart';

class SellViewTableFilter extends GetWidget<SellController> {
  const SellViewTableFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => CustomTableFilter(
            onTap: (value) {
              controller.selectedIndex.value = value;
            },
            item: controller.filter,
            selectedIndex: controller.selectedIndex.value,
          ),
        ),
        SizedBox(height: 12.h),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height: 40.h,
            width: 166.w,
            child: CustomTextFormField(
              controller: controller.searchController,
              labelText: 'Search',
              padding: EdgeInsets.all(4.r),
              labelColor: Color(0xFF9F9F9F),
              labelFontSize: 12.sp,
              labelFontWeight: FontWeight.w400,
              suffixIcon: Padding(
                padding: EdgeInsetsGeometry.only(right: 16.w),
                child: Image.asset(IconsPath.search, height: 16.h, width: 16.w),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
