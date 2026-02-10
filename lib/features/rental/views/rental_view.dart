import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/widgets/rental_search.dart';
import 'package:zb_dezign/features/rental/widgets/rental_status_type.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_banner.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentalView extends StatelessWidget {
  const RentalView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(title: 'Rental', onDrawerTap: () {}),
          SizedBox(height: 12.h),
          SharedContainer(
            padding: EdgeInsets.all(12.r),
            radius: 12.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryText(text: 'Rentals'),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text: 'Manage your rental subscriptions and requests.',
                  color: AppColors.secondaryTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          CustomBanner(),
          SizedBox(height: 16.h),
          RentalStatusType(),
          SizedBox(height: 12.h),
          Align(alignment: Alignment.centerRight, child: RentalSearch()),
        ],
      ),
    );
  }
}
