import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardPaymentSave extends StatelessWidget {
  const DashboardPaymentSave({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      radius: 20.r,
      padding: EdgeInsets.all(20.r),
      color: isDark
          ? AppColors.darkPendingBGColor
          : AppColors.darkPendingTextColor,
      border: Border.all(
        color: isDark ? AppColors.darkErrorBorder : Color(0xFFFFEDB9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Upgrade & Save',
            fontWeight: FontWeight.w700,
            fontSize: 14.sp,
            color: isDark ? AppColors.whiteColor : AppColors.labelColor,
          ),
          SizedBox(height: 10.h,),
          CustomPrimaryText(
            text: 'Extend your rental for 3 more months and get 7% off your remaining payments.',
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: isDark ? AppColors.darkPendingTextColor : AppColors.labelColor,
          ),
        ],
      ),
    );
  }
}
