import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_active_widgets/rentals_active_button.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_status.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentalsActiveDeliveryStatus extends StatelessWidget {
  const RentalsActiveDeliveryStatus({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SharedContainer(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: 'Delivery Status',
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: isDark ? AppColors.whiteColor : AppColors.darkColor,
              ),
              SizedBox(height: 8.h),
              CustomTableStatus(status: 'Pending'),
              SizedBox(height: 12.h),
              CustomDivider(),
              SizedBox(height: 12.h),
              row(title: 'Availability1', sub: '12/8/26', isDark: isDark),
              SizedBox(height: 20.h),
              row(
                title: 'Time',
                sub: 'Between 8 a.m. - 12 p.m.',
                isDark: isDark,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h,),
        RentalsActiveButton(),
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
