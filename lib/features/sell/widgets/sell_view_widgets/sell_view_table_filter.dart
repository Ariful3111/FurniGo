import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/sell/controller/sell_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_filter.dart';

class SellViewTableFilter extends StatelessWidget {
  const SellViewTableFilter({super.key});

  @override
  Widget build(BuildContext context) {
        SellController sellController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => CustomTableFilter(
            onTap: (value) {
              sellController.selectedIndex.value = value;
            },
            item: sellController.filter,
            selectedIndex: sellController.selectedIndex.value,
          ),
        ),
        SizedBox(height: 12.h),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height: 40.h,
            width: 166.w,
            child: CustomTextFormField(
              controller: sellController.searchController,
              labelText: 'Search Rental...',
              padding: EdgeInsets.all(4.r),
              labelColor: Color(0xFF9F9F9F),
              labelFontSize: 12.sp,
              labelFontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}