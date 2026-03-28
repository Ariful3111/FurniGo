import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controllers/rental_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';

class RentalSearch extends GetWidget<RentalController> {
  const RentalSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 170.w,
      child: CustomTextFormField(
        maxLines: 1,
        padding: EdgeInsets.only(left: 12.w),
        controller: controller.searchController,
        labelText: 'Search Rental...',
        labelFontSize: 12.sp,
        labelFontWeight: FontWeight.w400,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 8.w),
          child: Image.asset(IconsPath.search, height: 16.h, width: 16.w),
        ),
      ),
    );
  }
}
