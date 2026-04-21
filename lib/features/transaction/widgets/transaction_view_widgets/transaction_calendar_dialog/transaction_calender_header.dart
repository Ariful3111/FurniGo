import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class TransactionCalenderHeader extends StatelessWidget {
  const TransactionCalenderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 32.h,
      child: Row(
        children: [
          CustomPrimaryText(
            text: 'Select Dates',
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          Spacer(),
          SizedBox(
            width: 68.63.w,
            child: CustomTextFormField(
              controller: TextEditingController(),
              labelText: "From",
              borderColor:isDark
                  ? Color(0xFF697483)
                  : AppColors.darkSecondaryTextColor,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.46.h),
              borderRadius: 4.46.r,
              borderWidth: 0.56.r,
              fontSize: 10.sp,
              labelFontSize: 10.sp,
              fillColor:  isDark ? Color(0xFF0D0D0D) :null,
            ),
          ),
          SizedBox(width: 8.w),
          SizedBox(
            width: 68.63.w,
            child: CustomTextFormField(
              controller: TextEditingController(),
              labelText: "To",
              borderColor: isDark
                  ? Color(0xFF697483)
                  : AppColors.darkSecondaryTextColor,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.46.h),
              borderRadius: 4.46.r,
              borderWidth: 0.56.r,
              fontSize: 10.sp,
              labelFontSize: 10.sp,
              fillColor:  isDark ? Color(0xFF0D0D0D) :null,
            ),
          ),
        ],
      ),
    );
  }
}
