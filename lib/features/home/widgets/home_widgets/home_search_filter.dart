import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/home/controller/home_controller.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';

class HomeSearchFilter extends GetWidget<HomeController> {
  const HomeSearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeHelper().blurContainer(
          height: 44.h,
          width: 341.w,
          radius: 12.r,
          child: CustomTextFormField(
            controller: controller.searchController,
            border: BorderSide.none,
            isFilled: false,
            borderRadius: 12.r,
            padding: EdgeInsets.all(4.r),
            textColor: AppColors.whiteColor,
            cursorColor: AppColors.whiteColor,
            prefixIcon: Padding(
              padding: EdgeInsetsGeometry.only(left: 16.w),
              child: Image.asset(
                IconsPath.search,
                height: 20.h,
                width: 20.w,
                color: AppColors.whiteColor,
              ),
            ),
            labelText: 'Search Product...',
            labelColor: AppColors.whiteColor,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
        SizedBox(width: 12.w),
        HomeHelper().blurContainer(
          height: 44.h,
          width: 44.w,
          child: Center(
            child: Image.asset(IconsPath.filter, height: 24.h, width: 24.w),
          ),
        ),
      ],
    );
  }
}
