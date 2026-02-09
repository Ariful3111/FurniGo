import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_period_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentPeriodSuggestionField extends StatelessWidget {
  final bool selected;
  const RentPeriodSuggestionField({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    Get.find<RentPeriodController>();
    return Container(
      padding: EdgeInsets.all(16.r),
      height: 52.h,
      width: 240.w,
      decoration: BoxDecoration(
        color: selected ? Color(0xFFF4F6F8) : null,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1.r, color: AppColors.borderColor),
      ),
      child: Row(
        children: [
          Image.asset(IconsPath.edit, width: 20.w, height: 20.h),
          SizedBox(width: 12.w),
          CustomPrimaryText(
            text: 'Custom',
            fontSize: 16.sp,
            color: AppColors.labelColor,
          ),
        ],
      ),
    );
  }
}
