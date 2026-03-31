import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsCompleteDeliveryStatus extends StatelessWidget {
  const RentalsCompleteDeliveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        row(title: 'Availability1', sub: '12/8/26', isDark: isDark),
        SizedBox(height: 20.h),
        row(
          title: 'Time',
          sub: 'Between 8 a.m. - 12 p.m.',
          isDark: isDark,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  Widget row({
    required String title,
    required String sub,
    required bool isDark,
    FontWeight? fontWeight,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        CustomPrimaryText(
          text: sub,
          fontSize: 14.sp,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          fontWeight: fontWeight,
        ),
      ],
    );
  }
}
